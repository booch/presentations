layout: true

<header>
  <p class="left">@CraigBuchek</p>
  <p class="right">RubyConf 2015</p>
</header>


<footer>
  <p class="left">http://boochtek.com/preserves-rubyconf</p>
</footer>

---
class: title, middle, center

# Ruby Preserves

![jar of preserves with a ruby on the label](ruby_preserves.png)

---

About Me
========

* Independent web developer
    * [BoochTek][boochtek]
* Ruby / Rails programmer since 2006
* Agile practitioner
    * [This Agile Life][tal] podcast
* Boring slide designer

---
class: middle, center

I wrote an ORM

???

* I started writing a Ruby ORM last year

---
class: middle, center

I wrote an ORM in 350 lines

???

* It's surprisingly small
* I suppose you could call it a micro-ORM
    * Missing some features that most ORMs have
        * Mostly by design
    * But has some features that other micro-ORMs don't


* Was under 200 lines before I refactored to clean things up
    * It had less features, and the code was a mess
    * It supported has_many relationships in those 200 lines

---

ORM
===

* Object-Relational Mapper (ORM)


* Connects your app to your database


* Ruby - objects
* SQL - relations

???

* I want to make sure everyone knows what an ORM is
* SQL databases deal with relations
  * Relational algebra
* Ruby deals with objects
* ORM brings those 2 sides together
* Caveat: there's an "impedance mismatch" between the 2 sides
    * What works well on one side might not work well on the other
    * Some data structures can't be mapped 1-to-1
    * Example: tree structure
        * Easy to do in OOP
        * Several ways to represent in relational algebra

---

Why?
====

* I'm not happy with any Ruby ORM

???

* Why would I tackle such a daunting task?
* First, I'm not really happy with any existing Ruby ORM

---

Why?
====

* To explore and learn

???

* I've been interested in writing an ORM for a while
* My colleague Amos King (@adkron) often tells people to write their own ORM
* Maybe I can learn enough to write my ideal ORM someday
    * They say to write something good, "write one to throw away"
        * Make mistakes, learn from them
        * Have a better architecture / design the 2nd try

---

Why?
====

Trying to answer:

* How simple can we make an ORM?
* What is the **essence** of an ORM?

???

* ORMs are really complex
    * But do they have to be?
* How simple can we make an ORM?
* What is the **essence** of an ORM?

---

Why?
====

Trying to answer:

* Why do we try so hard to hide SQL?
    * Is the added complexity worth it?
* Why don't we just use SQL?
    * We have to know SQL anyway
    * All ORMs are very leaky abstractions

???

* Every ORM I've used has a DSL to help write SQL
    * DSL = domain specific language
    * But then you usually end up having to write some SQL
    * This is a leaky abstraction
    * Leaky abstraction = it doesn't always work
    * Leaky abstraction = sometimes you have to go down a level of abstraction
* What if we made the leaky abstraction leak all the way?

---

Opinion
=======

* Data Mapper pattern is better than the Active Record pattern

???

* I also started designing the ORM based on a few strong opinions

---

Opinion
=======

* Regular attributes and relational attributes need to be declared in one place

???

* The thing that drives me most crazy about ActiveRecord is having to look in 2 places for things
    * Relationships (or associations) are defined in the model
        * `has_many`
        * `belongs_to`
    * Attributes are defined in the DB schema

---

Opinion
=======

* NoSQL as a main data store is usually misguided

???

* I don't believe that most uses of NoSQL are legitimate
    * I don't think most of us know SQL well enough to know when to abandon it
* PostgreSQL can do just about anything you need
    * Including most of what NoSQL does
    * But it still uses SQL
* Sarah Mei has an excellent article on why to never use MongoDB
    * You'll paint yourself into a corner a year later
* I spoke w/ someone at Stripe about this
    * MongoDB is their primary DB
    * They copy everything out of it to PostgreSQL for ad-hoc queries

---

Opinion
=======

* Abstracting to allow switching RDBMSes? YAGNI!

???

* How many of you have every switched DB vendors?
    * Was it as easy as just changing your `database.yml` file?
* YAGNI = You Ain't Gonna Need It
* Developer workstations are fast enough to run a "full" RDBMS
    * RDBMS = Relational DataBase Management System
* It makes sense to do all your development on the same DB as production
    * If you can
    * Postgres and MySQL are definitely feasible
    * Oracle and SQL Server may not be feasible
        * "Express" versions will probably work
* Even if you do change DBs, it's never easy
    * Unless your app is simple and uninteresting
        * In that case, why would you need to change RDBMSes?
* Don't half prepare for something that probably won't happen

---

ActiveRecord
============

* Ubiquitous
    * Everyone knows it
    * Lots of people improving it
    * Plugins usually assume you're using it
    * Documentation
* Well-tested
* Well-understood
* Easy to use - it comes with Rails

???

* Who loves ActiveRecord?
* Who hates ActiveRecord?
* Who raised their hand both times?
* I'm mostly in the hate camp
* Who has had to manually type SQL in an ActiveRecord class?
    * So ActiveRecord is a leaky abstraction
        * SQL leaked up into the upper layers of abstraction
* ActiveRecord is the 800-pount gorilla
    * Every Rubyist knows it
    * It's well-tested
    * Frankly, it's just easy to start using it
        * You don't need to even think
* Odds are, if you're hired to work on Rails, you'll be using AR

---

Active Record Pattern
=====================

* Domain logic and persistence logic in same class


* ActiveRecord ORM uses this pattern

???

* Domain logic = logic about the "things" in our application
    * And the interactions between those things
* ActiveRecord (the ORM) is based on the Active Record pattern
    * "Active Record" (with a space) = the pattern
    * "ActiveRecord" (no space) = the ORM
* Active Record pattern described by Martin Fowler
    * [Patterns of Enterprise Application Architecture][peap]
    * Discusses the trade-offs
* A lot of terminology also comes from:
    * [Domain-Driven Design][ddd] by Eric Evans

---
class: diagram

Active Record Pattern
=====================

![UML diagram of Active Record Pattern](active_record.uml.png)

???

* Here's the UML diagram for the Active Record pattern
* Things to note here:
    * `find` is a class method
    * The object knows how to save itself
    * The model is dependent on the DB

---

Active Record Pattern
=====================

* Violates SRP (Single Responsibility Principle)


* Does 2 things:
    * Domain model
    * Persistence

???

* Who didn't "get" MVC before they used Rails?
    * Rails provided a big "a-ha" moment for most of us
* MVC is about separation of concerns
    * Models contain domain logic
    * Controllers handle web request/response
    * Views handle output
* Separation of concerns:
    * Is important
    * Is closely related to Single Responsibility Principle
* My biggest problem with AR is that it encourages bad engineering habits
    * Mostly SRP violation
    * Makes it harder to test domain logic without testing
* My experience - the sweet spot for ActiveRecord:
    * About 20 or fewer model classes
    * A fully CRUD app

---

Active Record Pattern
=====================

* Violates SRP (Single Responsibility Principle)


* Does 2 things:
    * Domain model
    * Persistence

???

* But most apps are more sophisticated than just CRUD

---

Data Mapper Pattern
===================

* Maps between domain objects and the database
* Domain objects don't have to know anything about the database or its schema
* DB schema and model object structure can differ
    * DB schema can change without having to change domain objects
        * Only the mapper changes

???

* There was a Ruby ORM called DataMapper
    * It didn't quite implement the Data Mapper pattern
    * It was closer to the Active Record pattern
* Martin Fowler explicitly says (in PEAP):
    * Active Record is a starting point
    * Should move to Data Mapper once you get more complex
* You might see domain model objects called "entities"
    * Entity = the object is defined by its ID
    * From [Domain-Driven Design][ddd] by Eric Evans
* Python's SQL Alchemy uses the Data Mapper pattern
    * This library is very highly regarded
    * Basically *the* Python ORM

---
class: diagram

Data Mapper Pattern
===================

![UML diagram of Data Mapper Pattern](data_mapper.uml.png)

???

* This is **not quite** the UML diagram for the Data Mapper pattern
    * It actually conflates Data Mapper and Repository patterns
* Things to note here:
    * The User class knows nothing about the database
    * The repo class knows how to find and save User objects

---

Repository Pattern
==================

* Represents a collection of domain objects

???

* The Repository pattern represents a collection of domain objects
    * Can treat the database as an in-memory collection
* We have something similar in ActiveRecord:
    * Class methods
    * Scopes
* But AR doesn't support 2 different data stores for the same model class
* Class methods are generally problematic
    * Leads to procedural code instead of OO code
    * Often indicates that you've missed an abstraction
    * Limits polymorphism
    * Hard to test
    * Hard to refactor
        * See [this Code Climate article][code-climate-class-methods] for details

---

Repository Architecture
=======================

* Domain model class handles business logic
* Repository class handles persistence
* Mapper class handles mapping database fields to object attributes

???

* Repository pattern gives a clear separation of concerns

---
class: diagram

Ruby Preserves
==============

![jar of preserves with a ruby on the label](ruby_preserves.png)

???

* I started Ruby Preserves by writing the README
    * Or maybe by coming up with a clever name
* README-driven development
    * Before writing **any** code
    * I put all those things in the README
        * Motivations
        * Opinions
        * How I wanted the ORM to be used (the API)

---

Domain Model
============

* Can use a Struct, an OStruct, a Virtus model, or a PORO class


~~~ ruby
User = Struct.new(:id, :name, :age, :addresses)

craig = User.new("booch", "Craig", 44, [])
~~~

???

* Here's what that API looks like
* Start with the domain model
* We can just use a plain old Ruby object (PORO)
* Here we're using a Struct
* Note that I can create my model with no database involved
    * How much of our app can we write without any persistence?
        * Probably much more than you think
* This is a lot simpler than an ActiveRecord model, right?
    * But it also shows all the field names in one place

---

Repository
==========

~~~ ruby
require 'preserves'

Preserves.data_store = Preserves.PostgreSQL('rubyconf_example')

UserRepository = Preserves.repository(model: User) do
end

craig = UserRepository.fetch('booch')
~~~

???

* When we get to the point of needing persistence:
    * Configure Ruby Preserves with the name of the DB
    * Define a repository associated with the model class
* Assuming we've got something in the DB:
    * We can retrieve it by its primary key
* As James Edward Gray pointed out:
    * I need to get rid of requiring the `model` keyword for the argument

---

Data Mapping
============

~~~ ruby
UserRepository = Preserves.repository(model: User) do
  mapping do
    primary_key 'username'
  end
end
~~~

???

* The next thing we need to do is:
    * Define mapping between domain model and database table
* Don't need to define table name, because hand-writing all SQL
* Define the primary key
    * So every repo gets a `fetch` method for free
    * Fetch method takes the ID (or primary key)
        * Returns the object associated with that ID

---

Data Mapping
============

~~~ ruby
UserRepository = Preserves.repository(model: User) do
  mapping do
    primary_key 'username'
    map id: 'username'
  end
end
~~~

???

* Database field named `username`
    * Corresponds to `id` attribute in model

---

Data Mapping
============

~~~ ruby
UserRepository = Preserves.repository(model: User) do
  mapping do
    primary_key 'username'
    map id: 'username'
    map :age, Integer
  end
end
~~~

???

* `age` field
    * Has the same name in DB and model
    * Specify it as an Integer
    * Specifying the type lets us serialize/coerce the data
        * As it goes between the DB and the model
        * Coercing between user input and the model is out of scope for the mapper

---

Repository Methods
==================

~~~ ruby
UserRepository = Preserves.repository(model: User) do
  def insert(user)
    SQL = "INSERT INTO 'users' (username, name, age) VALUES ($1, $2, $3)"
    result = query(SQL, user.id, user.name, user.age)
    unless result.size == 1
      raise "Could not insert User #{user.id} into DB"
    end
  end
end
~~~

???

* I haven't implemented any saving yet
    * But this shows the simplistic API usage
* `query` just executes some arbitrary SQL


* Note we're creating singletons for repositories
    * Changing that to a class is on my TODO list

---

Repository Methods
==================

~~~ ruby
UserRepository = Preserves.repository(model: User) do
  def with_id(id)
    SQL = "SELECT *, username AS id FROM 'users' WHERE username = $1"
    select(SQL, id)
  end
end
~~~

???

* Here we're using `select`
    * `select` does a query, then maps result set to objects
* This is basically equivalent to an ActiveRecord scope

---

Relationships
=============

* Has Many
* Belongs To
* Has and Belongs to Many
* Has Many Through

???

* Relationships aren't usually implemented in micro-ORMs
* I've implemented has_many and belongs_to
    * They took less than 2 hours each
        * But it took months to think about how to do it

---

Relationships - Has Many
========================

~~~ ruby
AddressRepository = Preserves.repository(model: Address) do
  mapping { map :city, String }
end

UserRepository = Preserves.repository(model: User) do
  mapping do
    primary_key 'username'
    map id: 'username'
    has_many :addresses, foreign_key: 'username'
             repository: AddressRepository
  end

  def all
    addresses = query("SELECT * FROM addresses")
    repository.select("SELECT * FROM users", addresses: addresses)
  end
end
~~~

???

* Collection of `addresses`
    * This is a `has_many` relationship
    * In DB, addresses are stored in a separate table
       * Addresses in that table reference the user table
           * With foreign key named `username`
       * Use the `AddressRepository` to new up each address
* Note that we have only 2 very simple queries there
    * `query` - creates a result set
    * `select` - creates a result set, and maps everything to objects
* We'd probably want to have a `WHERE` clause on the `addresses` query
    * So we only get the addresses associated with the users we got
* Examples are from acceptance tests

---

Relationships - Belongs To
==========================

~~~ ruby
GroupRepository = Preserves.repository(model: Group) do
  mapping { map :name, String }
end

UserRepository = Preserves.repository(model: User) do
  mapping do
    primary_key 'username'
    map id: 'username'
    belongs_to :group, repository: GroupRepository
  end

  def all
    groups = query("SELECT * FROM groups")
    repository.select("SELECT * FROM users", groups: groups)
  end
end
~~~

???

* We've added a `group` object here
    * Which we have to get from another table
    * This is a `belongs_to` relationship
    * `GroupRepository` will be used to new up that object
* Again, we have only 2 very simple queries
    * `query` v. `select`

* We don't support has_many and belongs_to for the same set of repos
    * It's generally recommended not to do this
        * Due to circular dependencies

---

N+1 Queries
===========

* Main query gets an object that includes a collection
* Iterating through the collection
    * Generates a separate query for each item in the collection


* If using ActiveRecord: use Bullet

???

* N+1 Queries are an anti-pattern
    * SQL queries involve network latency, so are slow
* If you've got a post with 1000 comments:
    * You'll have 1 SQL query for the post
    * You'll have 1000 queries, 1 to get each comment
* ActiveRecord will sometimes give you N+1 queries
* Usually, this is because you're manually iterating through a collection
    * Solution is often to use `include` to eagerly load the collection
* Bullet is a Rails plugin that watches for N+1 queries in DEV

---

Wrong Turns
===========

* I made several mistakes building Ruby Preserves
* Tried creating proxy objects for every relationship
    * So relationships weren't queried until they were used
* Was generating SQL in the Ruby Preserves code
* Led to N+1 queries

???

* I made a few mistakes along the way
    * Not so sure there aren't some remaining big mistakes
* Biggest mistake was generating SQL
    * Violated whole principle of using raw SQL
    * Complex code
    * Generated terrible SQL
    * Created N+1 queries
* Proxy object sound great at first
    * Don't populate the relationships unless they're used
    * Eager is usually better with DBs
* It took me a long time to think about how to do relationships
    * I took several wrong turns before I came up with something reasonable
    * Even when I was headed in the right direction, it took time to narrow in
    * Once I narrow in, the implementation was quick
        * I knew I had found the right abstraction

---

Relationships - JOINs
=====================

* JOINs happen in Ruby, not SQL

???

* I'm pretty happy with what I eventually came up with
    * Maybe
* JOINS are one part I'm not 100% comfortable with
* It'd be best if we did JOINs in SQL

---

Relationships - JOINs
=====================

~~~ sql
SELECT * FROM users;
┌──────────┬──────┬─────┬──────────┐
│ username │ name │ age │ group_id │
└──────────┴──────┴─────┴──────────┘

SELECT * FROM groups;
┌────┬──────┐
│ id │ name │
└────┴──────┘

SELECT groups.*, users.* FROM groups JOIN users
ON users.group_id = groups.id;
┌────┬──────┬──────────┬──────┬─────┬──────────┐
│ id │ name │ username │ name │ age │ group_id │
└────┴──────┴──────────┴──────┴─────┴──────────┘
~~~

???

* Here's where the problem comes in
    * We've got a JOIN of 2 tables with the same column name
    * The result has 2 columns named `name`
* Unfortunately, SQL doesn't really have a good simple solution for this

---

Relationships - JOINs
=====================

~~~ sql
SELECT g.id AS g__id, g.name AS g__name,
       u.username AS u__username, u.name AS u__username,
       u.age AS u__age
FROM groups AS g
JOIN users AS u ON u.group_id = g.id;
┌───────┬─────────┬─────────────┬─────────────┬────────┐
│ g__id │ g__name │ u__username │ u__username │ u__age │
└───────┴─────────┴─────────────┴─────────────┴────────┘
~~~

???

* This is how most ORMs solve this
    * Specifying every column
        * With a mapping in the SQL
        * And then another mapping in the Ruby code
* I didn't want to force that complexity on my API users
    * It would have changed the whole concept
* I think my solution is OK though
    * Web app usage patterns usually save us
        * A web app will never want to show 1000s of things on screen
        * All SQL queries in real apps should have LIMIT clauses

---

Advantages
==========

* Better meets the Single Responsibility Principle (SRP)
* Small, easy to understand
* Encourages better separation of concerns
* Encourages better understanding of SQL
* Experimentation / learning
* Model class contains everything you need to know
    * Don't have to look elsewhere to understand domain model

???

* So that's Ruby Preserves
* I think it has some advantages
* It's small:
    * Simple API makes it easy to use
    * Easy to understand the whole thing
* Encourages good engineering practices

---

Advantages - Size
=================

* Ruby Preserves - 350 lines of code
* Perpetuity - 2500 (with all 3 adapters)
* Lotus::Model - 2000 (plus it uses Sequel)
* Sequel - 31,000
* ActiveRecord - 210,000
* Sequel is 31 kloc

???

* And 100 of those 350 lines are just `end`
    * I refactor *mercilessly*
         * Most of my methods are 1 line
         * Smaller methods with good names:
             * Show intent
             * Easier to read code
* ActiveRecord stats from Sean Griffin
    * [Ruby Rogues episode 222][rr-222]


* I used David A. Wheeler's `sloccount` to get lines of code

---

Disadvantages
=============

* No composability
    * `published.by_author("craig")`
* Tied to a single RDBMS
    * No in-memory DB option
* API is slightly less convenient
    * No `user.save`
    * No `user.persisted?`
* No ActiveModel

???

* Composability is the biggest disadvantage
    * So we can't chain scopes like ActiveRecord does:
        * We have no equivalent to `published.by_author("craig")`
* We're tightly integrated to PostgreSQL
    * We could easily add adapters to support multiple DBs
        * But you might have to change your SQL
* Even if we had an in-memory option, you'd need 2 separate repos
    * One repo with the SQL for PostgreSQL
    * Another repo that does whatever the in-memory storage needed
* No ActiveModel support yet
    * Makes the API slightly harder to work with
        * Especially in Rails

---

Further Work
============

* Optimizations / caching
    * Prepared statements
* Automatically determine mappings, where possible
    * Virtus model attribute definitions
    * Database schema
* ActiveModel compatibility
* How does this compare with the DAO pattern?
* Add a layer to write the SQL for us?
* Could this be used in production code?

???

* Mostly a proof of concept at this point
    * Haven't done any optimizations
        * Haven't done any performance testing
* Prepared statements = caching SQL query plan on the DB server
    * Optimizes queries that runs frequently
* I'd like to automatically determine mappings, if we can
    * Could pull them from the DB
        * Remember, the Repository already knows about the DB
    * Could pull them from the model
        * Virtus has a nice API for defining attributes
            * Repository could ask the model what those attributes are

---

Further Work
============

* Optimizations / caching
    * Prepared statements
* Automatically determine mappings, where possible
    * Virtus model attribute definitions
    * Database schema
* ActiveModel compatibility
* How does this compare with the DAO pattern?
* Add a layer to write the SQL for us?
* Could this be used in production code?

???

* Implementing ActiveModel would probably be possible
    * Wouldn't be able to use POROs any more though
    * Biggest challenge - have to implement `persisted?` predicate
        * Predicate method = returns a true/false value
            * By convention ends in `?` in Ruby
            * Actually can be truthy/falsey in Ruby
        * Requires a circular dependency
            * Model class would have to depend on the Repository
                * To answer if a particular model object has been persisted
                * But the Repository already depends on the model class

---
Further Work
============

* Optimizations / caching
    * Prepared statements
* Automatically determine mappings, where possible
    * Virtus model attribute definitions
    * Database schema
* ActiveModel compatibility
* How does this compare with the DAO pattern?
* Add a layer to write the SQL for us?
* Could this be used in production code?

???

* DAO = Data Access Object
    * Research for this presentation, found a lot of similarities
* Layer on top of this to write the SQL for us?
    * Would give nice separation of concerns **within** the ORM
        * Separate SQL generation from object-relational mapping
* I'd like to see if I can get this to the point to be used in production code

---

Alternatives
============

1. Lotus::Model
2. Perpetuity
3. ROM
4. Sequel
5. ActiveRecord with declared attributes

???

* Ruby Preserves is nowhere near ready for production
* I still don't have an ORM I'm really happy with
* This is the order I'd currently consider them, for my personal projects
    * Obviously, context matters a lot

---

Alternatives
============

1. Lotus::Model
2. Perpetuity
3. ROM
4. Sequel
5. ActiveRecord with declared attributes

???

* Lotus::Model
    * Pretty young and immature (0.5)
    * Implements Data Mapper pattern
    * Can use POROs
        * Just need to define 3 simple methods
    * Defines "scopes" similar to how Ruby Preserves does it
        * All built-in scopes (`where`, `order`, `limit`) are private
    * Repository adapters/strategies for:
        * SQL
        * In-memory
        * Flat files
    * Main problem I have with it:
        * All mapping are done in a single config section
            * I'd rather mappings be in the Repository classes
    * Other problems:
        * Scopes are class methods

---

Alternatives
============

1. Lotus::Model
2. Perpetuity
3. ROM
4. Sequel
5. ActiveRecord with declared attributes

???

* Perpetuity
    * Jamie Gaskins
    * Small
    * No support for relationships - yet
    * Used in a few production apps

---

Alternatives
============

1. Lotus::Model
2. Perpetuity
3. ROM
4. Sequel
5. ActiveRecord with declared attributes

???

* ROM - Ruby Object Mapper
    * Piotr Solnica (primarily)
    * Goes further than Data Mapper pattern
    * Command-Query Separation
    * Immutability in many places
    * A couple problems I have:
        * Requires a **very** different mindset
        * Built bottom-up, less attention to public API

---

Alternatives
============

1. Lotus::Model
2. Perpetuity
3. ROM
4. Sequel
5. ActiveRecord with declared attributes

???

* Sequel
    * Jeremy Evans
        * Won a Ruby Hero award earlier this year
        * Also wrote the Excellent
    * Excellent ORM
    * Found it when researching a talk on Alternatives to ActiveRecord
    * It's exactly what I'm looking for
        * Except it implements the Active Record pattern
        * I want the Sequel of the Data Mapper pattern

---

Alternatives
============

1. Lotus::Model
2. Perpetuity
3. ROM
4. Sequel
5. ActiveRecord with declared attributes

???

* ActiveRecord added attribute declarations in version 4.2
    * Only popularized in 5.0
    * There were plugins available before that
        * Annotate Models and its descendants
            * Adds comments to the model file, with fields listed
        * My own Virtus::ActiveRecord

---

Further Reading
===============

* [Turning the Tables][turning-tables] (Brad Urani)
* [Data Mapper vs Active Record][dm-v-ar]
* [Weird Tricks to Write Faster, More Correct Database Queries][faster-correct-db-queries]
* [The State of Ruby ORM][state-of-orm] (2011)
* [DataMapper Retrospective][datamapper-retro] (2011)
* [Sequel is awesome and much better than ActiveRecord][sequel-awesome]
* [Why You Should Never Use MongoDB][no-mongo] (Sarah Mei)
* [Why Ruby Class Methods Resist Refactoring/][code-climate-class-methods]
* [ORM Hate][orm-hate] (Martin Fowler)

???

* Turning the Tables: How to Get Along with your Object-Relational Mapper
    * Brad Urani is talking about immutable data structures tomorrow
* Sarah Mei is one of the organizers of this event

---

Thanks
======

* James Edward Gray II
* Amos King
* Zubair Chaudary
* Brian Button
* Jamie Gaskins
* Piotr Solnica
* Charlie Sanders


* [Remark JS][remark] - slide show software
* [Ditaa][ditaa] - UML diagrams

???

* I want to thank all the people who gave me feedback
* And thank you all for attending


* James Edward Gray II - conference track chair; lots of feedback
* Amos King - lots of feedback
* Zubair Chaudary - lots of feedback
* Brian Button - suggestion to restructure the talk so as not to bury the lede
* Jamie Gaskins - some suggestions; exmaple of writing a simple ORM (Perpetuity)
* Charlie Sanders - some suggestions
* Piotr Solnica - a few pointers; examples of writing ORMs (ROM, DataMapper); Virtus

---

Feedback
========

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Project: https://github.com/boochtek/ruby_preserves


* Slides: http://boochtek.com/preserves-rubyconf
* Slides: https://github.com/booch/presentations/



[rr-222]: http://devchat.cachefly.net/rubyrogues/transcript-222-rr-rails-5-with-sean-griffin-ruby-rogues.pdf
[peap]: http://www.amazon.com/dp/0321127420
[code-climate-class-methods]:  http://blog.codeclimate.com/blog/2012/11/14/why-ruby-class-methods-resist-refactoring/
[ddd]: http://www.amazon.com/dp/0321125215
[no-mongo]: http://www.sarahmei.com/blog/2013/11/11/why-you-should-never-use-mongodb/
[state-of-orm]: http://solnic.eu/2011/11/29/the-state-of-ruby-orm.html
[datamapper-retro]: http://rhnh.net/2011/11/29/datamapper-retrospective
[sequel-awesome]: http://rosenfeld.herokuapp.com/en/articles/ruby-rails/2013-12-18-sequel-is-awesome-and-much-better-than-activerecord
[orm-hate]: http://java.dzone.com/articles/martin-fowler-orm-hate
[dm-v-ar]: http://jgaskins.org/blog/2012/04/20/data-mapper-vs-active-record/
[turning-tables]: https://medium.com/@bradurani/turning-the-tables-how-to-get-along-with-your-object-relational-mapper-e5d2d6a76573
[faster-correct-db-queries]: https://kev.inburke.com/kevin/faster-correct-database-queries/


[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[boochtek]: http://boochtek.com
[tal]: http://www.thisagilelife.com


[remark]: http://remarkjs.com/
[ditaa]: http://ditaa.sourceforge.net/
