---
---

# Manifesto for Lazy Product Development [original]

- We are uncovering lazier ways of developing valuable products by doing it and
- Through this work we have come to value:


- Keeping slack over fully utilizing all the time
- A small simple quality product over a large complex product
- Doing only what's necessary over exhaustively discovering all tasks Doing less to deliver the same over doing more to deliver more
- That is, while there is value in the items on the right, we value the items on the left more.
this declaration

---

# Lazy Manifesto Principles [original]

- We work hard only to make our work easier and safer.
- Doing nothing is always an option.
- We seek to minimize the number of backlog items while keeping the value of the whole backlog.
- We believe keeping velocity increasing is not always good.
- We eliminate tasks that generate no value.
- We combine tasks to reduce latency and rework.
- We rearrange tasks to find problems early.
- We simplify all tasks as much as possible.
- We are not afraid of eliminating our own tasks / processes by continuously finding lazier ways.
- We focus on expanding our capabilities not on increasing our capacities
- We always look to get help from others while we provide help to others with minimum effort.

---

- Transformations
    - Ever noticed how controller actions aren't terribly related
        - Some deal with a single object, some with a collection
    - A controller is more like a module of related transformations
        - Each action method is a separate transformation
            - From request to response
            - Plus persistence (side effect) in _some_ cases
                - We could change persistence to just be a description of a transformation
                    - Phoenix/Elixir does this
                    - Then it's just another output, instead of a side effect
            - Part of input is current state of system
                - We could pass in current state of system as "context"
- Hence the recommendation that not all models need to be ActiveRecord models
    - Some can be Value Objects
- Terminology gets **very** confusing
    - Technically a Value Object is not an object in the OOP sense
        - It doesn't have behavior
        - It **might** have methods, but they're "pure" functions
            - They don't change any internal or external state
    - Value Objects and Entities are both technically "records"
        - They have properties/attributes/fields/members
        - Objects are essentially records plus methods and inheritance
        - SQL rows are also records, and results are sets of records
        - Records are effectively tuples of name/value pairs
            - But are not generally stored in memory that way

---

---
class: transition

# Immutability

???

- FP works best with immutable data
    - _modern_ FP
- By definition, a function doesn't change anything
    - It just returns a specific output for any given input

---

# Immutable Objects

~~~ ruby
x = [1, 2, 3]
y = [1, 2, 3].freeze

x << 4
x #= [1, 2, 3, 4]

y << 4 #=! FrozenError: can't modify frozen Array
~~~

???

- TODO: Talk about `dup` and `clone` and `deep_dup`
- Talk about `String#+@`
    - `+@` means unary plus
    - So `+string` is equivalent to `string.dup if string.frozen?`
- Note that immutability is required for passing objects between Ractors/threads

---

# Entity

- Identity
- Mutable state
    - Setters
- Behavior

???

- Identity is critical
    - EXAMPLE: Can't have 2 objects representing **me**
        - With the same class
- Mutable (at least in ActiveRecord)
    - State
    - Setters
- Active Record models are Entities
    - plus a Repository
    - plus more: normalization, validation, etc

---

# Aside: Private Methods

~~~ ruby
private def my_value
  computation_of_my_value
end
~~~

???

- We can use `private` and `protected` this way
- I prefer this style
    - I can **easily** see that method is private
    - I don't have to look anywhere else in the code
    - I can move it around without accidentally making it public

---

# Initialization

~~~ ruby
attr_reader :current_account

def initialize
  @current_account ||= Account.find_by(user: current_user)
end
~~~

???

- We can also just compute the value in the initializer
    - If it's always needed
        - Or _usually_ needed **and** very cheap to compute
- Also allows using instance variable
    - Instead of method or attribute reader
    - Style choice
- Arguments for always using reader/method:
    - Consistent
        - Should not care if it's method or instance variable
            - Uniform access principle
                - No syntax difference between accessing a property stored in memory and accessing a value computed by a (0-arity) method
    - Easier to change later

------

- https://en.wikipedia.org/wiki/Uniform_access_principle
    - Betrand Meyer, [Object-Oriented Software Construction](https://en.wikipedia.org/wiki/Object-Oriented_Software_Construction)
        - Eiffel programming language

---

# Story Time

???

- Commodore 64 in stores

---

# Story Time

~~~
10 PRINT "Craig is great!"
20 GOTO 10
~~~

---

# Story Time

~~~
10 N = 0
20 POKE 52380, N
30 N = N+1
20 GOTO 20
~~~

???

- I learned more
- I got more sophisticated
    - Change the background color
- TODO: Show the effect

---

# Story Time

~~~
POKE 49152,xxx
SYS 49152
~~~

???

- I learned 6502 assembler
- Ported the BASIC code
- Much faster
    - Changed color several times per scan line
- TODO: Show the effect

---

# Story Time

~~~
POKE 49152,xxx
SYS 49152
~~~

???

- I was telling this story in the early 2000s
- That 10-12 bytes bothered me
- I optimized my 10-byte program
    - Down to 7 bytes
    - About 20 years later

---

# Story Time: Moral

???

- Moral of the story:
    - Even a 20-year-old, 10-byte program can change
