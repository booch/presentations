layout: true

<footer>
  <p class="left">@CraigBuchek</p>
  <p class="right">http://craigbuchek.com/railsconf2019</p>
</footer>

---
class: title, middle, center
# Active Record
# The Repository Pattern
# And You

![Craig Buchek's avatar](images/CraigBuchek-avatar.png)
![RailsConf 2019 logo](images/RailsConf2019-mini-logo.svg)

???

* Welcome!
* Today we're going to dig into Active Record
    * With a couple detours
* Lower right: Link to slides
    * Press `P` to see my presenter notes
        * Links and extra notes I won't talk about
* My Twitter handle is in the lower left corner
    * Feel free to tweet *at* me or *about* me
    * Use the hashtag `#railsconf`

---

# Agenda

* The problem with Active Record
* Alternatives to Active Record
* Problems with the alternatives
* The Repository pattern
* A solution to the problem

???

* We'll focus on some major issues with Active Record
* We'll look at some alternatives
    * But then talk about why you might not want to use the alternatives
* Then I'll talk about a potential solution
    * And the pattern that I think we should all be using

---

# Active Record

* Ubiquitous
    * Everyone knows it
    * Lots of people improving it
    * Plugins usually assume you're using it
    * Documentation
* Well-tested
* Well-understood
* Easy to use - it comes with Rails

???

* Who here uses Active Record?
* Anyone who hasn't used Active Record?
* Who has used a different Ruby ORM?
    * A different non-Ruby ORM?
* Who loves Active Record?
* Who hates Active Record?
* Anyone besides me that has a love/hate relationship with Active Record?
* Active Record is the 800-pound gorilla
    * Odds are, if you're hired to work on Rails, you'll be using it

---

# ORM

* Object-Relational Mapper (ORM)


* Connects your app to your database


* Ruby - objects
* SQL - relations

???

* First, I want to make sure everyone knows what an ORM is
* Ruby deals with objects, Obviously
* SQL databases deal with relations
    * There's actually a relational algebra they work with
        * How cool is that?
        * I'm not aware of any such mathematical foundations of NoSQL databases
* An ORM brings those 2 sides together
    * Maps between objects and relations
* NOTE: There's an "impedance mismatch" between the 2 sides
    * What works well on one side might not work well on the other
    * Some data structures can't be mapped 1-to-1
    * One canonical example: tree structure
        * Easy to do in OOP
        * Several ways to represent in relational algebra
        * Difficult to map between those 2 very different representations
* I dove more in-depth into the essence of an ORM in [my RubyConf 2015 talk][RubyConf2015]

---

# Active Record Pattern

> An object that wraps a row in a database table or view,
> encapsulates the database access,
> and adds domain logic on that data.

<cite>— [Martin Fowler, Patterns of Enterprise Application Architecture][PEAA]</cite>

???

* Rails' Active Record is based on the Active Record pattern
* Here's Martin Fowler's definition
* Note that he lists 3 separate things there:
    * Wrapping a database table
    * Encapsulating database access
    * Adding domain logic
* You could argue that that wrapping and encapsulating are a single thing
    * But domain logic is clearly a separate concern
* Having that "and" in there indicates a violation of SRP
    * Single Responsibility Principle

---
class: image-only, active-record-pattern

# Active Record Pattern

![UML class diagram of Active Record pattern](images/active_record.uml.svg)

???

* Here's a UML class diagram of the Active Record pattern
* Note that there are 2 kinds of things going on
    * `find` and `save` deal with persistent storage
    * `name`, `age`, and `address` deal with domain logic

---

# Active Record - Problems

* Violates SRP
* Implements several concerns
* Model classes do too much
* BIG!!
* Too much "magic"

???

* Biggest problem with Active Record:
    * Encourages bad engineering habits
    * Mostly because it violates the Single Responsibility Principle
        * Co-mingles persistence and domain logic
* Separation of concerns in important
    * Just like Rails separates M-V-C (model-view-controller) concerns
* As your project gets bigger, Active Record's flaws become more apparent
* My experience is that the sweet spot for Active Record is about 12-20 model classes

-----

* ROM documentation comparing with Active Record also says Active Record works well for small projects

---

# Active Record - Size

* Rails 5.2 is 75 kloc
* Active Record is 30 kloc
    * 430 files
    * About 40 main modules
        * Over 50 with ActiveModel
* Adds about 300 instance methods
* Adds about 600 class methods

???

* Active Record is **BIG**
    * It's about 40% of Rails
    * The size is another symptom of a violation of the Single Responsibility Principle
    * It tries to do too much in one place
    * It conflates multiple concerns
* Showing some method stats are from a Rails 5.2.3 model w/ 1 field
* For comparison on the number of methods:
    * Object has 86 methods
    * String and Array have about 250 methods
* The number of instance methods is pretty bad
    * But the number of class methods is *really* bad
        * Recall all the issues I mentioned about class methods

-----

* For comparison:
    * Sequel is 33 kloc
    * ROM is 8.2 kloc (plus several DRY.rb libraries)
    * Hanami::Entity is 2.1 kloc
        * Sits atop Sequel or ROM
    * Perpetuity is 2.5 kloc (with all 3 adapters)
    * Array has 239 methods
    * Enumerable has 33 methods
* kloc = 1000 lines of code
* Using `cloc`:
    * `*-5.2.3` - 76.6k
    * AR - 23.2k
    * ARel - 3.9k
    * AModel - 3.1k
    * Railties - 8.6k
    * ActionPack - 12.6k
        * Controller - 3.5k
        * View - 7.3k
* Counting methods/modules:
    ~~~ ruby
    require "active_record"
    ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
    ActiveRecord::ConnectionAdapters::ConnectionPool.new(
      ActiveRecord::ConnectionAdapters::ConnectionSpecification.new(
        "primary",
        {adapter: "sqlite3", database: ":memory:"},
        "sqlite3_connection"
      )
    )
    ActiveRecord::Schema.define do
      create_table :users, force: true do |t|
        t.string :name, nil: false
      end
    end
    class User < ActiveRecord::Base; end
    User.methods.count  # => 612
    User.instance_methods.count  # => 312
    ActiveRecord::Base.ancestors.size  # => 64 (7 of which are `Object` or above)
    ~~~

---

# Active Record - Bifurcation

* Attributes and relationships defined different places
    * Attributes are defined in DB schema
    * Relationships are defined in the model class
* Can be solved using new attributes API (Rails 5.0)

???

* Other thing I find super *frustrating* about Active Record
    * Relationships (or associations) are defined in the model
        * `has_many`
        * `belongs_to`
    * Attributes are defined in the database schema
* I think this is a terrible abuse of the DRY principle
    * DRY says there should be one place to look for any piece of info
    * I feel like attributes and relations are similar kinds of things
        * Clue: I often want to see them at the same time
    * Putting related things in different places seems counter to DRY guidance
* Have to look in 2 places for all details about a model
    * This is a case of too much magic for me
    * Work-arounds like `model-annotations` help
        * I also use an Atom package to toggle showing a model's attributes from the schema
            * But it's currently broken
* Attributes API is a big help here
    * Actually debuted in Rails 4.2, but was not publicized
    * But we have to *use* it, and hardly anyone does
        * Anyone here use annotations for model attributes?
* I had also released a couple gems to define attributes in Active Record models
    * Virtus-ActiveRecord
    * ActiveRecord-AttributeDeclarations
    * These are now unnecessary, due to the new Attributes API

-----

* DRY = Don't Repeat Yourself
    * For details, see [The Pragmatic Programmer]

---
class: single-image

# Architecture: The Lost Years

![Screen grab from Uncle Bob's Architecture: The Lost Years talk](images/Architecture: The Lost Years.png)

???

* Who's seen this talk by Uncle Bob?
    * "Architecture: The Lost Years"
* Was anyone else by chance there at Ruby Midwest 2011?
    * It's a seminal talk
    * Oddly, it seems to have only been given once
        * Maybe because he never showed the details
* Since this talk (and earlier), I've struggled:
    * To find a way to get Rails to implement all the architectural suggestions
    * Interactors gem
        * Splits Rails controller and business logic
        * Works well for that part
    * Never found a great answer for splitting Entities and DB
        * This is the quest I'll be talking about

---
class: image-only, clean-architecture

# Clean Architecture

![Clean Architecture book](images/Clean Architecture book.jpg)

???

* After almost 10 years, Uncle Bob wrote a book on the topic
    * [Clean Architecture]
    * It doesn't really help me with this problem
* [Clean Architecture blog article] is a good succinct explanation

---
class: single-image, sequel

# Sequel

![Sequel ORM logo](images/Sequel.svg)

???

* The first stop on my quest is the Sequel ORM

---

# Sequel

* Excellent documentation
* Tons of plugins
    * Especially for PostgreSQL
* Leverages database features
    * Like foreign key constraints
* Supports almost any SQL database you can think of
* Thread safety, connection pooling

???

* Biggest surprise when I did research for the an earlier **related** talk
* Written by Jeremy Evans
    * Winner of a Ruby Hero award
    * Is Jeremy here, by chance?
* Has tons of plugins, leveraging database features
    * Especially for Postgres
* Supports almost any SQL database you can think of
* Nicely documented

---

# Sequel

* Two separate layers you can use
    * Sequel::Dataset
    * Sequel::Model (Active Record pattern)

~~~ ruby
DB = Sequel.connect("postgres://user:password@localhost/my_db")

DB.create_table :items do
  primary_key :id
  String :name, unique: true, null: false
  TrueClass :active, default: true
  Float :price
  foreign_key :category_id, :categories
  index :created_at
end
~~~

???

* Sequel has 2 separate APIs that you can use
* Here's the code used to set up Sequel for the next couple slides

---

# Sequel Dataset

~~~ ruby
DB[:items].insert(name: "abc", price: 1.23)
DB[:items].where("price < ?", 100).update(active: true)
DB[:managers].where(salary: (50_000)..(100_000)).order(:name)
DB[:managers].where{ salary > (100_000) }.order(:salary).limit(10)
DB[:managers].each{ |mgr| puts mgr[:name], mgr[:salary] }
~~~

???

* Sequel's syntax is really nice
    * Line 4: Note the block that lets you use bare column names
        * And greater than
        * There's a gem called [Squeel][Squeel] to add this to Active Record
            * But it's fragile, and breaks when new versions of Active Record come out
* Datasets are enumerable, with each element a hash-like object
    * Line 5
* I haven't come across anything that Sequel can't do well

---

# Sequel Model

~~~ ruby
class Post < Sequel::Model
  set_dataset DB[:my_posts].where(author: "booch")
  many_to_many :categories
end

post = Post[123]
post.title = "hey there"
post.save

Post.where(title: /ruby/).update(category: "ruby")
Post.where(category: "ruby").each{|post| puts post}
Post.where{num_comments < 7}.delete
~~~

???

* Here's a higher-level API, using objects
    * You'd probably be more likely to use this layer in Rails
* Like Active Record, attributes are derived from the database schema
    * But also like Active record, relationships have to be specified manually
* I really like Sequel
    * I wish Active Record was more like Sequel
    * But Sequel doesn't solve the problem I'm trying to address

---
class: single-image, rom

# ROM

![ROM.rb logo](images/ROM.svg)

???

* Next ORM in my journey of exploration: ROM
    * Ruby Object Mapper

---

# ROM

* Ruby Object Mapper
* Started life as DataMapper 2
* Supports SQL, MongoDB, YAML, HTTP
    * Can support almost any data source, via adapters

???

* Originally meant to implement the Data Mapper pattern
* Renamed from DataMapper 2 to ROM in 2013
* Moved away from object-relational mapping altogether in 2014
    * So not really an "ORM"
    * Just maps to data, not objects
* Most of the work done by Piotr Solnica
* Similar in spirit (and partly inspired by) Elixir's Ecto

-----

* Piotr Solnica formerly wrote Virtus
    * A really nice aAttribute declarations library

---

# ROM

* Functional approach to persistence
* Focus on mapping to domain data types
* Promotes immutable objects
* Promotes separation between reading and writing
    * Command Query Responsibility Segregation (CQRS)
* Architecture has strong separation of concerns
    * Can implement DDD or a true ORM on top of its components

???

* A bit complex to use - commands, relations, mappers
    * Have to buy into a completely different paradigm
* ROM's developers are also responsible for the DRY.rb libraries
    * Really good at small, independent, low-level composable libraries
* Some of the leaders of the movement toward FP and immutability in Ruby
    * A bit focused on low-level details at times
    * End up taking longer than expected, but really high quality code

---

# ROM Relation

~~~ ruby
class User < ROM::Struct
end

class Users < ROM::Relation[:sql]
  schema do
    attribute :id, Types::Int.meta(primary_key: true)
    attribute :name, Types::String
    attribute :age, Types::Int
    associations do
      has_many :roles
      belongs_to :companies, as: :company
    end
  end

  def over_18
    where{ age >= 18 }
  end
end
~~~

???

* This looks relatively straight-forward
    * _Go over the various parts_
* We could also tell ROM to pull the schema from the DB:
    * `schema(infer: true)`
    * Then we would not have to list all the attributes
        * But it seems preferred to define all the attributes

-----

~~~ ruby
require "rom/sql"
require "rom/struct"

rom = ROM.container(:sql, 'sqlite::memory') do |conf|
  conf.default.create_table(:users) do
    primary_key :id
    column :name, String, null: false
    column :age, Integer
  end
end

class UserRepo < ROM::Repository[:users]
end

# user_repo = UserRepo.new(rom)
users_relation = Users.new(rom)

~~~

---

# ROM Relation - Saving

~~~ ruby
users_relation
  .changeset(:create, name: "Craig", age: 48)
  .commit
~~~

???

* To save an object, we start with the relation
    * Then we pass a changeset
        * Includes `:create` or `:update`
        * Pass all the attributes as a hash
    * Then we have to explicitly commit the changes

---
class: image-only, rom-overview

# ROM Overview

![ROM Overview diagram](images/ROM Overview.jpg)

???

* I found ROM to be really complex
* Here's their overview diagram
* I honestly can't follow everything that's going on there

---

# ROM Downsides

* Too different
* Complexity
    * Relation
    * Schema
    * Repository
    * Mapper
    * Command
    * Changeset

???

* I *want* to like ROM
    * But I find it too complex and confusing
    * I couldn't actually get things set up right to run the code I showed

---
class: single-image, hanami

# Hanami

![Hanami logo](images/Hanami.jpg)

???

* Last on my quest is the model layer of Hanami
* Hanami is a full web framework
    * An alternative to Rails

---

# Hanami Model

* SQL (via Sequel), memory, and file adapters
* Follows Data-Driven Design architecture
    * Entity
    * Repository
    * Mapper
    * Query

???

* Hanami supports SQL (via Sequel), memory, and file adapters
* Follows Data-Driven Design architecture
    * Entity = model, without persistence or validations
    * Repository = mostly like class methods on an AR model class
        * `create`, `update`, `persist`, `delete`
        * `all`, `find`, `first`, `last`
    * Mapper = declaration of how to map between DB records and object attributes

---

# Hanami Entity

~~~ ruby
class Article < Hanami::Entity
  attributes do
    attribute :id, Types::Int
    attribute :author, Types::String
    attribute :text, Types::String
    attribute :date, Types::Date
  end
end

article = Article.new(author: "Craig", text: "Hello", date: Date.today)
article.text  # => "Hello"
~~~

???

* Here's the first part of a Hanami model
* Inheriting from `Hanami::Entity` adds only a few methods:
    * `id`, `id=`, `initialize`, plus `attributes` class method
    * That's **all** it adds!
* The default initializer takes a hash of attributes to set the entity's attributes
* Types come from the dry-types library
* We could also let the model pull the schema from the database
    * Like Active Record

---

# Hanami Repository

~~~ ruby
class ArticleRepository < Hanami::Repository
  def by_author(name)
    query{ where(author: name).order(:date) }
  end
end

articles = ArticleRepository.new
articles.create(Article.new(author: "Craig", text: "Hello", date: Date.today))
articles.find(12)
articles.by_author("Craig")
~~~

???

* Persistence is done by the repository class
* Note that things like `where` and `order` are private
    * Can only use them within queries
        * Queries are analogous to scopes in Active Record

---

# Downsides of the Alternatives

* Everyone uses Active Record
    * Have to learn something new
* Rails add-on gems assume you're using Active Record

???

* I think Hanami is my favorite Ruby ORM
    * If I had my choice, I'd probably use it in Rails
* But it's not a very realistic option
    * Requires everyone to learn something new
    * Not much documentation on using it with Rails
    * Rails add-ons assume you're using Active Record
        * They may or may not work with another ORM

---

# Repository Pattern

* Represents a collection of domain objects
* Used in Hanami::Repository

???

* Hanami Model implements the Repository pattern
* The Repository pattern represents a collection of domain objects
    * Can treat the database as an in-memory collection
* We have something similar in Active Record:
    * Class methods
        * `create`, `where`, `find`, `all`
        * Scopes
* Class methods are generally problematic
    * Leads to procedural code instead of OO code
    * Often indicates that you've missed an abstraction
    * Limits polymorphism
    * Hard to test
    * Hard to refactor

-----

* More details on problems with class methods:
    * [Code Climate article][Code Climate - Class Methods]

---
class: image-only

# Repository Pattern

![UML class diagram of Repository pattern](images/repository.uml.svg)

???

* Here's the UML class diagram of the Repository pattern
* Note the arrows
    * The domain model is not dependent on anything else
* Clear separation of concerns
    * Domain model class handles business logic
    * Repository class handles persistence
* Now we *could* have more than 1 repository for a given model
    * For sharding
    * For soft-deleted items
    * For read/write segregation
    * For in-memory "persistence" for tests
* May also see this with a 3rd class:
    * Mapper class handles coercion between database fields and object attributes

---
class: single-image, activerecord-repository

# ActiveRecord-Repository

![ActiveRecord-Repository logo (3 books stacked)](images/ActiveRecord-Repository.svg)

???

* I've spent several years looking for a way to have my cake and eat it too:
    * Use Active Record
    * Separate domain model from database persistence
* One Saturday morning, I was thinking about it again
    * I came up with a solution I thought could work
    * In Rails 3, they split out Active Record into several modules
    * I'd use the various modules that Active Record uses
* Funny part: I probably mis-remembered
    * I think it was Action Controller that got modularized
    * Active Model got pulled out of Active Record
    * Modules in Active Record maybe weren't meant to be used separately
* Wasn't quite as easy to make it work as I expected
    * All the modules have a lot of interdependencies
    * There's no real documentation on how to use each module
        * Or what the dependencies look like
* Turned out that the domain model is just *most* of Active Model
    * So I call that "ActiveModel::Entity"
        * I originally named it "ActiveRecord::Entity"
    * And the repository is *most* of Active Record

---

# Model with Active Record

~~~ ruby
class User < ActiveRecord::Base
  belongs_to :company
  has_many :roles

  validates :age, numericality: { greater_than: 0 }

  scope :over_18, -> { where(age: 18..) }
end
~~~

???

* I'm going to show the difference between:
    * Using standard Active Record
    * Using ActiveRecord-Repository
* Here's a typical Active Record model

---

# Model with ActiveRecord-Repository

~~~ ruby
class User
  include ActiveModel.entity(datestamps: false)

  attribute :name, :string
  attribute :age, :integer

  belongs_to :company
  has_many :roles

  validates :age, numericality: { greater_than: 0 }
end
~~~

???

* Here's the same thing using ActiveRecord-Repository
* Instead of subclassing, include a module
    * Module is dynamically generated through the call to the `ActiveModel.entity` method
        * So we can pass parameters
        * I'll talk about this some more when I show the implementation
* I call the module we mix in "ActiveModel::Entity"
    * The term "entity" comes from Eric Evans's [Domain-Driven Design][DDD]
    * An entity is an object that has an identity
        * We could have 2 items with all the same attributes, but different IDs
            * Then those would be considered different entities
        * If 2 items of the same type have the same ID
            * Then those would be considered to be the same thing
* The other major difference is that we declare the attributes (name and type) here
    * Fixes my 2nd biggest gripe with Active Record
* Still have the `belongs_to`, `has_many`, and validation declarations
* If we had any instance methods, they'd still be here
* What we don't have here is the scope
    * And you won't be able to call `User.all` or `User.where` or the like

-----

* I had `date_of_birth`, with a computed age, but the calendar math was too complex to show on screen

---

# Repository with ActiveRecord-Repository

~~~ ruby
class User::Repository
  include ActiveRecord.repository()

  scope :over_18, -> { where(age: 18..) }
end
~~~

???

* Here's the repository for that same class
* Again, we're including a module instead of subclassing
    * We could pass some parameters
        * Model class we're working with
            * We get the attributes from the model, to ensure our database schema matches up
            * Here it default to the `User` entity model
                * Because `User::Repository` naming convention was followed
        * Database table name
            * If it can't be easily derived
        * Primary key
        * Mapping of database column names to entity attribute names
* Scope is in the repository side
    * Because we use it on the collection of model objects
        * Not any individual model object

---

# Controller with Active Record

~~~ ruby
class UsersController
  def create
    user = User.new(params[:user])
    if user.save
      respond_with user
    else
      render :new, errors: user.errors
    end
  end
end
~~~

???

* Here's a typical controller in Rails with Active Record
* Note that we tell the user model to save itself
* The `save` method will return false if it failed to save

---

# Controller with ActiveRecord-Repository

~~~ ruby
class UsersController
  def create
    user = User.create(params[:user])
    if user.valid?
      User::Repository.save(user)
      respond_with user
    else
      render :new, errors: user.errors
    end
  end
end
~~~

???

* Here's the same thing with my ActiveRecord-Repository gem
* Only 2 lines changed
    * Line 4 - explicitly test to see if the model is valid
    * Line 5 - tell the repository to save the model object
        * Instead of telling the model object to save itself
* One caveat: validations can't check for uniqueness without a race condition
    * Would still need to handle an exception on the `save` if you need uniqueness

---

# Implementation - ActiveModel::Entity

~~~ ruby
module ActiveModel
  def self.entity(datestamps: true)
    modules = [::ActiveModel::Entity]
    modules << ::ActiveModel::Entity::DateStamps if datestamps
    composite_module(modules)
  end

  def self.composite_module(modules)
    Module.new.tap { |composite_module|
      composite_module.define_singleton_method(:included) do |entity_module|
        modules.each do |mod|
          entity_module.__send__(:include, mod)
        end
      end
    }
  end
end
~~~

???

* Here's a bit of the implementation of the Entity module
* I'm using the Parameterized Module pattern here
    * This is the simplest implementation of the pattern (I believe)
    * Basically, we're creating a list of modules
        * Then creating a module composed of each of those modules
    * I talked about this trick in [my RubyConf talk on Ruby idioms in 2014][RubyConf2014]
        * I call it Parameterized Module Inclusion, or the Module Factory pattern
        * It allows passing parameters
            * Can specify whether to include date stamps for create and update
            * Could specify a different name for the implicit `id` field
* I had previously called this ActiveRecord.entity ...

-----

* More info on implementing this pattern:
    * [My RubyConf 2014 talk][RubyConf2014]
        * The pertinent bit starts on page 30
    * [Virtus][virtus]
        * Especially `lib/virtus/builder.rb`
    * [An article about the Ruby Module Builder Pattern][Ruby Module Builder Pattern]
    * [A similar hack to make ActiveRecord includable][includable-activerecord]
        * Especially `lib/includable/activerecord/model.rb`

---

# Implementation - ActiveModel::Entity

~~~ ruby
module ActiveModel
  module Entity
    def self.included(mod)
      # ActiveModel::Model includes AttributeAssignment, Validations,
      #     Conversion, Naming, Translation.
      mod.extend ActiveModel::Model
      mod.include ActiveModel::AttributeMethods
      mod.include ActiveModel::Attributes
      mod.include ActiveModel::Validations
    end
  end
end
~~~

???

* ... But we're not really using anything from ActiveRecord
    * Which is why I changed the name from ActiveRecord::Entity to ActiveModel::Entity

---

# Implementation - ActiveRecord::Repository

~~~ ruby
module ActiveRecord
  def self.repostitory(model: nil, table_name: nil)
    ::ActiveRecord::Repository
  end
end
~~~

???

* Here's the repository side
* Again, I'm using the Parameterized Module pattern

---

# Implementation - ActiveRecord::Repository

~~~ ruby
module ActiveRecord
  module Repository
    def self.included(mod)
      mod.extend ActiveModel::Naming
      mod.extend ActiveSupport::Benchmarkable
      mod.extend ActiveSupport::DescendantsTracker
      mod.extend ConnectionHandling
      mod.extend QueryCache::ClassMethods
      mod.extend Querying

      ...

    end
  end
end
~~~

???

* This side is all ActiveRecord
    * Plus some custom code
        * Mostly making sure ActiveRecord still works
            * Despite the pieces we've taken away
    * It uses **most** of ActiveRecord
        * But not quite *ALL*

---

# Implementation - ActiveRecord::Repository

~~~ ruby
module ActiveRecord
  module Repository
    def self.included(mod)
      def mod.save(entity)
        mirror_object = new(entity.attributes.transform_keys(&:to_sym))
        mirror_object.save
        entity.id = mirror_object.id
      end
    end
  end
end
~~~

???

* We've also got some helper methods that call into ActiveRecord
* This method lets you do `User::Repository.save(user)`
* This one's a bit tricky
    * We have to create an ActiveRecord model object to save
* We update the entity's ID when we save
    * This lets us know that the entity has been persisted
        * Allows us to implement `ActiveModel#persisted?`
            * Which I *think* is required

---

# Challenges

* Figuring out which modules are needed on each side
* Fixing how Active Record determines the base class
* Convincing Active Record to work without some of its modules

???

* There were quite a few more challenges than I had expected
    * Probably due to the fact that I mis-remembered which thing got modularized
* It didn't occur to me for quite a while how to separate the modules
* It turned out:
    * The entity side is all ActiveModel
    * The repository side is all ActiveRecord
* We're not subclassing ActiveRecord::Base
    * Active Record uses that to figure some things out
    * ActiveRecord::Base includes info about the connection to the database
    * Had to tell Active Record that the repository class is not an `abstract_class`
* Currently fighting with Active Record and relations
    * Getting an error that doesn't seem directly related to the code I added
    * Really hard to troubleshoot

---

# Future Work

* Make sure all types of relations work properly in every situation
    * Loading
    * Saving
    * Deletions
* Move validations to `attributes` declarations
    * `attribute :age, :integer, required: false, numericality: {greater_than: 0}`
* Automatically-generated migrations

???

* I still have a lot of work to do to make this usable
    * Main part is testing all the ways relations work
        * Cascading deletions
        * Loading
            * Have to load relations and map them to objects
        * Saving
            * Have to map relations to SQL and save them
* Because we have all the info we need, we could automatically create migrations
    * Data Mapper did this
    * Only thing we're really missing is indexing
* Go see Matt Duszynski's talk on migrations
    * My teammate/colleague
    * Covers a lot of "gotchas" with migrations
    * Following time-slot
    * In room 101 F
    * I plan to look at those gotchas if I get to automating migrations

---

# I Need Your Help

* Star the repo
* Feedback
    * Twitter
    * Email
    * In person
* Contributions
    * GitHub Issues
    * Pull requests

???

* I need some help from all of you
* Please star the repo on GitHub if you're interested
    * So I know people are interested
    * The more interest, the more likely I am to complete the project
* I'm easy to find
    * On the Internet
    * In person
* I've made the repo and the talk easy to find
* I'll have links to everything on the last slide

---
class: single-image, thanks

# Thanks!

![Thanks!](images/Thank You - word cloud.jpg)

???

* I'd like to thank you all for coming and watching
* I'd like to especially thank my coworkers who watched a preview of this talk
    * And provided valuable feedback

---
class: single-image, this-agile-life

# Podcast

![This Agile Life podcast logo](images/This Agile Life.jpg)

---
class: single-image, weedmaps

# Sponsored By

![Weedmaps logo](images/Weedmaps.png)

???

* A huge thanks to my employer, Weedmaps, for sponsoring this talk
* There are about 20 of us here
    * Most of us are wearing Weedmaps t-shirts
* We're hiring!
* Come see us at our booth
    * We will have t-shirts

---

# Resources

* Me
    * GitHub: booch
    * Twitter: @CraigBuchek
    * Email: craig@boochtek.com


* ActiveRecord-Repository
    * https://github.com/boochtek/activerecord-repository

???

* The source for this presentation is on GitHub
    * In my `presentations` repo
* There's the link to the ActiveRecord-Repository gem
    * But it's easier to get there from my GitHub page
* Feel free to stop me in the hall to ask me questions

-----

* Source for this talk:
    * https://github.com/booch/presentations/tree/master/ActiveRecord_and_Repository_Pattern
* Tools used:
    * [Remark][Remark] slide show (Markdown to HTML)
        * Customized CSS
        * Customized presenter notes layout
    * [DITAA][DITAA] convert ASCII diagrams to SVG (or PNG)


[PEAA]: https://martinfowler.com/books/eaa.html
[DDD]: http://dddcommunity.org/book/evans_2003/
[RubyConf2014]: https://booch.github.io/presentations/ruby_idioms/slides.htm
[RubyConf2015]: https://booch.github.io/presentations/Ruby_Preserves/slides.html
[Ruby Module Builder Pattern]: https://dejimata.com/2017/5/20/the-ruby-module-builder-pattern
[includable-activerecord]: https://github.com/boochtek/includable-activerecord
[virtus]: https://github.com/solnic/virtus
[Squeel]: https://github.com/activerecord-hackery/squeel
[Code Climate - Class Methods]:  http://blog.codeclimate.com/blog/2012/11/14/why-ruby-class-methods-resist-refactoring/
[Remark]: http://remarkjs.com/
[DITAA]: http://ditaa.sourceforge.net/
[The Pragmatic Programmer]: https://pragprog.com/book/tpp/the-pragmatic-programmer
[Clean Architecture]: https://www.amazon.com/Clean-Architecture-Craftsmans-Software-Structure-ebook/dp/B075LRM681
[Clean Architecture blog article]: https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html
