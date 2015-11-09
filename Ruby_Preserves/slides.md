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

---
class: middle, center

I wrote an ORM

---
class: middle, center

I wrote an ORM in 350 lines

???

* Was under 200 lines before I refactored to clean things up.

---

ORM
===

* Object-Relational Mapper (ORM)


* Connects your app to your database


* Ruby - objects
* SQL - relations

???

* First, I want to make sure everyone knows what an ORM is
* SQL databases deal with relations
  * Relational algebra
* Ruby deals with objects
* Caveat: there's an "impedance mismatch" between the 2 sides

---

Why?
====

* I'm not happy with any ORM

???

* I don't think the Active Record pattern is usually the right choice
* I'm still looking for the ideal ORM implementing the Data Mapper pattern
    * Sequel is the ideal ORM implementing the Active Record pattern

---

Why?
====

* To explore and learn

???

* I've been interested in writing an ORM for a while
* My colleague Amos King (@adkron) often tells people to write their own ORM
* Maybe I can learn enough to write the ideal Data Mapper ORM
    * Preserves is the "one to throw away"

---

Why?
====

* See how simple can we make an ORM that is still useful

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

* ActiveRecord is pretty complex
    * Is the complexity really better than the complexity of SQL?
* A typical ORM uses an internal DSL to generate external DSL code
* What if we made the leaky abstraction leak all the way?

---

Opinion
=======

* Data Mapper pattern is better than the Active Record pattern

???

* I also started designing the ORM based on a few strong opinions
* ActiveRecord is fine if you're just writing a CRUD front-end, with little interesting behavior

---

Opinion
=======

* Regular attributes and relational attributes need to be declared in one place

???

* The thing that drives me most crazy about ActiveRecord is having to look in 2 places for things
    * Relationships are defined in the model
    * Attributes are defined in the DB schema

---

Opinion
=======

* NoSQL as a main data store is usually misguided

???

* PostgreSQL can do just about anything you need, including what NoSQL does, using SQL
* See Sarah Mei's article on why to never use MongoDB
* I spoke w/ someone at Stripe, where MongoDB is their primary DB
    * They copy everything out of it to PostgreSQL for ad-hoc queries

---

Opinion
=======

* Abstracting to allow switching RDBMSes is premature optimization

???

* RDBMS = Relational DataBase Management System
    * Developer workstations are fast enough to run "full" RDBMSes
    * If you're not using "interesting" features, then you're probably using "standard" SQL

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
    * I hate ActiveRecord - mostly
* Who raised their hand both times?
* Who has had to manually type SQL in an ActiveRecord class?
    * So ActiveRecord is a leaky abstraction
        * SQL leaked up into the upper layers of abstraction
* ActiveRecord is the 800-pount gorilla
* Odds are, if you're hired to work on Rails, you'll be using AR

---

Active Record Pattern
=====================

* Domain logic and persistence logic in same class
* Violates SRP (Single Responsibility Principle)


* ActiveRecord ORM uses this pattern

???

* The biggest problem with AR is that it encourages bad engineering habits
    * This is mostly because it violates the SRP
* Note "Active Record" is the pattern and "ActiveRecord" is the ORM
* Active Record pattern described by Martin Fowler
    * [Patterns of Enterprise Application Architecture][peap]
* Separation of concerns in important
    * Just like Rails separates M-V-C concerns
    * But ActiveRecord does a terrible job at it
* My experience is that the sweet spot for AR is about 20 model classes
    * Data Mapper pattern has a little more overhead in the number of classes/concepts
        * Pays off a lot as you have more classes
        * Still has a couple advantages with only a few classes

---

Data Mapper Pattern
===================

* Maps between domain objects and the database
* Domain objects don't have to know anything about the database or its schema
* DB schema and model object structure can differ
    * DB schema can change without having to change domain objects
        * Only the mapper changes

???

* Note that the DataMapper Ruby gem didn't actually use the Data Mapper pattern
    * It used the Active Record pattern
* Python's SQL Alchemy uses the Data Mapper pattern
    * This library is very highly regarded
    * Basically *the* Python ORM

---

Repository Pattern
==================

* Represents a collection of domain objects

???

* In ActiveRecord, the class methods often act as the repository
    * But you can't easily have 2 repositories for the same model class with different data stores
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

* We have a clear separation of concerns
* Sometimes we'll call the domain models entities
    * From [Domain-Driven Design][ddd] book
    * Entities implies that the object is defined by its ID

---

DSLs
====

* Domain-Specific Languages


* Internal DSL
* External DSL

???

* Someone recently asked me what's the difference between a DSL and an API?
    * Anyone have any good answers?
    * Best (but not satisfying) answer was "I know it when I see it"
* I asked Matthias Felleisen, the creator of Racket, the same questions
    * He said (at least in Racket) that a DSL gives DSL-specific error messages
    * I'm not sure we can give DSL-specific error messages in Ruby internal DSLs
* Who knows what the difference between an internal DSL and an external DSL is?
    * An internal DSL is written in the same language as the host language
    * An external DSL is a completely separate language
* SQL is an external DSL.
* ActiveRecord is an internal DSL

---

Domain Model
============

* Can use a Struct, an OStruct, a Virtus model, or a PORO class


~~~ ruby
User = Struct.new(:id, :name, :age, :addresses) do
end

craig = User.new("booch", "Craig", 44, [])

####

class User
  attr_accessor :id
  attr_accessor :name
  attr_accessor :age
  attr_accessor :addresses
end
~~~

???

* PORO = plain old Ruby object
* Note that I can create my model with no database involved

---

Data Mapping
============

~~~ ruby
UserRepository = Preserves.repository(model: User) do
  mapping do
    # The database field named 'username' corresponds to the 'id' attribute in the model.
    map id: 'username'
    # The 'age' field should be mapped to an Integer in the model.
    map :age, Integer
    # The user has a collection of Address objects.
    has_many :addresses, repository: AddressRepository, foreign_key: 'username'
  end
end
~~~

---

Repository Methods
==================

~~~ ruby
UserRepository = Preserves.repository(model: User) do
  def insert(user)
    result = query("INSERT INTO 'users' (username, name, age) VALUES ($1, $2, $3)",
                   user.id, user.name, user.age)
    raise "Could not insert User #{user.id} into database" unless result.rows == 1
  end

  def older_than(age)
    SQL = "SELECT *, username AS id FROM 'users' WHERE age > $1 ORDER BY $2"
    select(SQL, age, :name)
  end

  def with_id(id)
    SQL = "SELECT *, username AS id FROM 'users' WHERE username = $1"
    select(SQL, id)
  end
end
~~~

???

* Note that we're still creating singletons for repositories
    * Changing that to a class is on my TODO list

---

Relationships
=============

* Has Many
* Belongs To
* Has and Belongs to Many
* Has Many Through

???

* Relationships aren't usually implemented in micro-ORMs

---

N+1 Queries
===========

* Main query gets a collection
* You then iterate through the collection
    * Running another query for each item in the collection

???

* The 1 is the main query
* The N is all the queries for all the items in the collection
* This is an anti-pattern, of course
    * Because if you have 1000 items, you have 1001 SQL queries
    * SQL queries involve network latency, so are slow
* ActiveRecord will sometimes give you N+1 queries
* Usually, this is because you're manually iterating through a collection
* Use a tool like Bullet in Rails to watch for N+1 queries

---

Wrong Turns
===========

* I made a mistake trying to make relationships work in Ruby Preserves
* Tried creating proxy objects for every relationship
    * So relationships weren't queried until they were used
* Was generating SQL in the Ruby Preserves code
* Led to N+1 queries

???

* This was a wrong direction on many fronts
    * It violated the whole principle of using raw SQL
    * It was complex code
    * It generated terrible SQL
* The core idea was fine
    * Don't populate the relationships unless they're used
* But it was a learning experience
* It took me a long time to think about how to do relationships
    * I took several wrong turns before I came up with something reasonable
    * Even when I was headed in the right direction, it took time to narrow in
    * I'm pretty happy with what I eventually came up with

---

Relationships
=============

~~~ ruby
UserRepository = Preserves.repository(model: User) do
  mapping do
    primary_key 'username'
    map id: 'username'
    has_many :addresses, repository: AddressRepository, foreign_key: 'user_id'
  end

  def all
    users = query("SELECT * FROM users")
    addresses = repository.select("SELECT * FROM addresses", addresses: addresses)
  end
end
~~~

???

* ActiveRecord calls these "associations"
* Note that we have only 2 very simple queries there

---

Advantages
==========

* Domain class contains everything you need to know
    * Don't have to look elsewhere to understand everything a class contains
* Better meets the Single Responsibility Principle (SRP)
* Small, easy to understand
    * Currently about 350 lines of code
* Encourages better separation of concerns
* Encourages better understanding of SQL
* Experimentation / learning

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
* We could easily add adapters to support multiple DBs
    * But you might have to change your SQL
* Even if we had an in-memory option, you'd need 2 separate repos
    * One repo with the SQL for PostgreSQL
    * One repo that does whatevery the in-memory storage needed
* Adding ActiveModel would probably be possible
    * Wouldn't be able to use POROs any more though
    * Implementing `user.save` would require a circular dependency
        * The model's `save` call would have to call the repo
        * The repo depends on the model class

---

Further Work
============

* Optimizations / caching
    * Prepared statements
* Automatically determine mappings, where possible
    * Virtus model attribute definitions
    * Database schema
* Is this really an ORM?
* Is this really the DAO pattern?
* Could this be used in production code?
* Add a layer to write the SQL for us?

???

* DAO = Data Access Object

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
* ActiveRecord added attribute declarations in version 4.2
    * Only popularized in 5.0
    * There were plugins available before that
        * Annotate Models and its descendants
        * My own Virtus::ActiveRecord

---

Further Reading
===============

* [The State of Ruby ORM][state-of-orm] (2011)
* [DataMapper Retrospective][datamapper-retro] (2011)
* [Sequel is awesome and much better than ActiveRecord][sequel-awesome]
* [Why You Should Never Use MongoDB][no-mongo] (Sarah Mei)
* [ORM Hate][orm-hate] (Martin Fowler)
* [Data Mapper vs Active Record][dm-v-ar]
* [Turning the Tables: How to Get Along with your Object-Relational Mapper][turning-tables] (Brad Urani)
* [Weird Tricks to Write Faster, More Correct Database Queries][faster-correct-db-queries]

---

Colophon
========

* [Remark][remark] - JavaScript slide show from Markdown

---

Feedback
========

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Project: https://github.com/boochtek/ruby_preserves


* Slides: http://tinyurl.com/ruby-preserves-stl
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