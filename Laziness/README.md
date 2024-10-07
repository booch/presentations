# Laziness is a Virtue

## Abstract

We can write Ruby code in any number of styles, but the community has some accepted norms. For example, almost nobody uses `for` loops any more. We've decided that some styles are "better" than others. And we can keep finding "better" styles.

In this talk, we'll dig into a more functional "lazy" style. Instead of setting up variables ahead of time, we'll call methods as needed. Instead of thinking about how to compute things, we'll think about properties of objects. This style has improved the readability of my code, and it will help you too.

## Top-Level Outline

- Intro
- Memoization
- Data Objects
    - Entity vs Value Object
- Functional Programming in Ruby
    - show how Ruby is already functional, using collections
        - map vs each
- Lazy Evaluation
- Ask vs Tell
    - Asking is pure FP, with immutability
    - Ask for a transformation
    - Boundaries
- Immutability
- "Better" Styles
    - Readability
    - Maintainability
    - Changeability
- Laziness-Driven Development
- Conclusions

## Notes

- Temporary variables in a computation are a smell
    - They're a sign that the computation is too complex
    - They're a sign that the computation is too eager
    - They're a sign that the computation is too imperative
    - Extract a method instead
- Design classes so we have more of these immutable objects
    - They're easier to test
    - They're easier to understand
    - They're easier to change
- A Rails controller doesn't actually have to **do** anything
    - It's just a transformation from a request to a response
        - Plus some persistence (side effect)
            - Phoenix/Elixir even makes the persistence just a description of a transformation
        - Plus some logging (side effect)
- Lazy evaluation - delays the evaluation of an expression until its value is needed
    - we usually apply this to evaluation within an expression or a function/method/block
        - really, closures are what give us lazy evaluation
            - and objects are effectively closures
                - they both combine data and behavior
    - allows us to define control flow (structures) as abstractions instead of primitives
        - so blocks are lazy
        - methods are lazy
    - allows us to define infinite data structures
    - allows us to define control flow structures as abstractions instead of primitives
    - the opposite is eager evaluation
        - AKA strict evaluation
    - Ex: `x = 2 * 3` is eager
        - `x` will contain 5
    - Ex: lambdas like `x = -> { 2 * 3 }` are lazy
        - we have to call `x.call` to get the value
    - Ex: methods like `def x = 2 * 3` are lazy
        - we have to call `x` to get the value
    - usually, we think of lazy evaluation as being about collections
        - Ex: `x = [1, 2, 3].map { |n| n * 2 }`
            - `x` will contain `[2, 4, 6]`
        - but we don't have to evaluate the `map` until we need the value
            - Ex: `x = [1, 2, 3].lazy.map { |n| n * 2 }.first`
            - `x` will contain `2`
            - we only evaluated the `map` enough to get the first value
- Notice that the methods we're looking at take no arguments
    - They're based solely on the object's state
    - This is a good transition to Entity vs Value Object
    - Because Ruby follows the uniform access principle, 0-argument methods are the same as getters
    - Other principles:
        - Interface Segregation Principle
        - Dependency Inversion Principle
        - Separation of Concerns
        - Tell, Don't Ask
- Methods that start with `set`, `get`, `find`, `fetch`, `load`, `compute`, `calculate`
    - They're telling **how**
        - But from the caller's perspective, we **don't care** how, just **what**
        - When we say `2 * x`, we don't care if the compiler uses a shift or a multiply
    - TODO: Example using binary to show how shift left is the same as multiply by 2
    - Just ask for what you want - what's the name of the result?
        - That's what we should name the method
- Properties of objects
- Ask, don't tell v. Tell, don't ask
    - OOP says "tell, don't ask"
    - FP says "ask, don't tell"
    - Elixir seems to make a good distinction between the two
        - Structs for immutable data
        - Services for behavior
        - They don't think "I'll change this object and save it"
            - They think "what changes do I want to persist?"
            - Because they think in terms of data, not objects
                - At the lower levels
                - At the higher levels, they think in terms of processes
- Immutable objects
    - `freeze`
    - Add to Data initializer?
        - Nope, they're already frozen
        - Maybe a "deep freeze" would be beneficial?
- "Better" styles
- Readability
    - Easier understanding, really
    - Easier to change, really

---

## Other Thoughts

- Data#with
    - https://docs.ruby-lang.org/en/3.2/Data.html#method-i-with
    - Warning: shallow copy!
        - Really only matters if you mutate anything _inside_ of the object's state
- Other laziness
    - UNIX systems don't allocate memory until it's **used**
        - It doesn't allocate any memory when you _ask_ for memory
    - Linux systems use copy-on-write to avoid copying memory until it's **changed**
        - A new process doesn't copy it's parent's memory when it's created
            - It only creates a new memory map — pointers to the parent's memory blocks

~~~ ruby
def do_if_true(condition, &block)
  condition || block.call
end
do_if_true( 1 == 1 ) { puts "TRUE" } #=> "TRUE"
do_if_true( 1 == 2 ) { puts "TRUE" } #=> no output, the block does not run

~~~

## Thoughts on a better framework

~~~ ruby
class USA::State
    include Framework.attribute

    ABBREV_TO_STATE = {
        AL: "Alabama",
        AK: "Alaska",
        # ...
    }.freeze
    STATES = STATE_TO_ABBREV.values.sort.freeze
    ABBREVS = STATE_TO_ABBREV.keys.map(&:to_s).sort.freeze
    STATE_TO_ABBREV = ABBREV_TO_STATE.invert.freeze

    # This is the default implementation, from including Framework.attribute.
    # NOTE: This may raise InvalidAttribute, if:
    #   - an exception occurs when normalizing or validating
    #   - or the validation returns a falsey value
    attr_reader :value
    def initialize(value)
      @value = normalize(value)
      fail InvalidAttribute, "Invalid value: #{value}" unless validate(@value)
    rescue StandardError
      raise InvalidAttribute, "Invalid value: #{value}"
    end

    # If we get an abbreviation, convert it to the **name**.
    override def normalize(value)
      value = ABBREV_TO_STATE[value.to_sym] if value.to_s.upcase.in?(ABBREVS)
      value.to_s.titleize
    end

    # NOTE: Validate always runs after normalize.
    override def validate(value) = value.in?(STATES)

    # value is the value of the attribute
    def abbrev = STATE_TO_ABBREV[value].to_s
end

class Address
    include Framework.value

    attribute :street, String
    attribute :city, String
    attribute :state, USA::State, # USA::State does its own normalization and validation.
        format: -> { |value| value.abbrev }
    attribute :zip_code, String,
        normalize: -> { |value| value.to_s },
        validate: { format: /\d{5}/ }

    def full = "#{street}\n#{city}, #{state.abbrev}  #{zip_code}"
end

class User
    include Framework.entity

    attribute :name, String, required: true # Implies `validates: { presence: true }`
    attribute :age, Integer, required: false
    attribute :email, String, unique: true # Implies `validates: { uniqueness: true }`
    attribute :address, Address

    def full_name = "#{first_name} #{last_name}"
end

User::Repository = Framework.repository(:users,
                                 model: User,
                                 connection: App::DB.connection) do
    def all = super.order(:created_at)
    def find(id) = super
    def create(params) = super(params)
    def update(id, params) = super(id, params)
    def delete(id) = super
end

module User::Operations
    extend Framework.operations(User::Repository)

    # Sets up `user` and `users` methods for all operations.
    operate on: :user, plural: :users
        define(:user) { User::Repository.find_by(params) }
        define(:users) { User::Repository.all(params) }
    end

    class Index < Framework::Operation::Index
        step :normalize

        def response = { users: users }
    end

    class Create < Framework::Operation::Create
        step :normalize
        step :validate
        step :persist
        step :notify { |user| UserMailer.welcome(user).deliver_later }
        def response = { user: user }
    end

    operation :update do
        step :normalize
        step :validate
        step :update { user.update(params) }
        step :notify
        def response = { user: user }
    end

    step :validate { ... }
    step :persist { ... }
end

module User::Web
    extend Framework.rest_api(accept: [:html, :json, :xml, :yaml], except: [:delete])

    # NOTE: These are the default definitions.
    get '/users', to: User::Operations::Index
    get '/user/:id', to: User::Operations::Read
    post '/users', to: User::Operations::Create
    put '/users/:id', to: User::Operations::Update
    # delete '/users/:id', to: User::Operations::Delete
end

module User::CLI
    # Define the `user` command to the CLI app.
    extend Framework.cli(command: :user,
                        operations: User::Operations)

    # NOTE: These are the default definitions.
    # These are all subcommands of the `user` command
    def list(params) = User::Operations::Index.call(params)
    def show(id:) = User::Operations::Read.call(id:)
    def create(params) to: User::Operations::Create.call(params)
    def update(id:, params) to: User::Operations::Update.call(id:, params)
    def delete(id:) to: User::Operations::Delete(id:)
end
~~~
