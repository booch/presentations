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

---

Active Record
=============

* Ubiquitous
    * Everyone knows it
    * Lots of people improving it
    * Plugins usually assume you're using it
    * Documentation
* Well-tested
* Well-understood
* Easy to use - it comes with Rails

???

* Who here uses ActiveRecord?
* Who hasn't used ActiveRecord?
* Who has used a different Ruby ORM?
* Who loves ActiveRecord?
* Who hates ActiveRecord?
* Who both loves and hates ActiveRecord?
* I hate ActiveRecord - mostly
* But ActiveRecord is the 800-pount gorilla
* Odds are, if you're hired to work on Rails, you'll be using AR

---

# Active Record

???

* The biggest problem is that it encourages bad engineering habits
    * This is mostly because it violates the SRP
* Active Record pattern described by Martin Fowler
    * [Patterns of Enterprise Application Architecture][peap]
* Separation of concerns in important
    * Just like Rails separates M-V-C concerns
    * But ActiveRecord does a terrible job at it
* My experience is that the sweet spot for AR is about 20 model classes

---

Active Record - Size
====================

* Rails is 270 kloc
* Active Record is 210 kloc
* Adds about 300 instance methods
* Adds about 400 class methods

???

* ActiveRecord is **big**
    * The size of AR is just a symptom of the SRP violation
    * It tries to do too much in one place, conflating multiple concerns
* kloc = 1000 lines of code
* For comparison:
    * Sequel is 31 kloc
    * Hanami::Entity is 2 kloc
    * Perpetuity is 2.5 kloc (with all 3 adapters)
* AR LOC stats are from Sean Griffin, [Ruby Rogues episode 222][rr-222]
* Method stats are from a Rails 4.2 model w/ 1 field

---

Active Record - Insanity
========================

* Attributes and relationships defined different places
    * Attributes are defined in DB schema
    * Relationships are defined in the model class
* Can be solved using new attributes API (Rails 5.0)

???

* The thing that drives me most crazy about ActiveRecord is having to look in 2 places for things
    * Relationships (or associations) are defined in the model
        * `has_many`
        * `belongs_to`
    * Attributes are defined in the DB schema
* This is a terrible abuse of the DRY (don't repeat yourself) principle
    * DRY says there should be one place to look for any piece of info
    * But it doesn't mean to put related things in different places
* True madness to have to look in 2 places for all details about a model
    * This is a case of too much magic for me
    * Work-arounds like model-annotations helped
* Attributes API actually debuted in Rails 4.2, but was not publicized
* I had also released a couple gems to define attributes in AR models
    * Virtus-ActiveRecord
    * ActiveRecord-AttributeDeclarations

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
class: single-image, sequel

![Sequel ORM logo](images/Sequel.svg)

---

Sequel
======

* Excellent documentation
* Tons of plugins
    * Especially for PostgreSQL
* Leverages database features
    * Like foreign key constraints
* Supports almost any SQL database you can think of
* Thread safety, connection pooling

???

* Biggest surprise when I did research for the 1st version of this talk last year
* Written by Jeremy Evans
    * Winner of a Ruby Hero award earlier this year

---

Sequel
======

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

---

Sequel Dataset
==============

~~~ ruby
DB[:items].insert(name: "abc", price: 1.23)
DB[:items].where("price < ?", 100).update(active: true)
DB[:managers].where(salary: (50_000)..(100_000)).order(:name)
DB[:managers].where{salary > (100_000)}.order(:salary).limit(10)
DB[:managers].each{|mgr| puts mgr[:name], mgr[:salary]}
~~~

???

* Sequel's syntax is really nice
* Datasets are enumerable, with each element a hash-like object
* I haven't come across anything that Sequel can't do well

---

Sequel Model
============

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

* Like ActiveRecord, attributes are derived from the database schema
    * But also like AR, not relationships
* Seems like a small advantage over ActiveRecord
    * Doesn't solve the SRP issues

---
class: single-image

![ROM.rb logo](images/ROM.svg)

---

ROM
===

* Ruby Object Mapper
* Started life as DataMapper 2
* Supports SQL (via Sequel), MongoDB, YAML, HTTP
    * Can support almost any data source, via adapters

???

* Initially meant to implement the Data Mapper pattern
* Renamed from DM2 to ROM in 2013
* Moved away from object-relational mapping altogether in 2014
    * So not really an "ORM"
    * Just maps to data, not objects
* Most of the work done by Piotr Solnica

---

ROM
===

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
* Developers really good at small, independent, low-level composable libraries
* Some of the leaders of the movement toward FP and immutability in Ruby
    * A bit focused on low-level details at times
    * End up taking longer than expected, but really high quality code

---
class: single-image

![Hanami logo](images/Hanami.jpg)

---

Hanami Model
===========

* Data Mapper pattern
* SQL (via Sequel), memory, and file adapters
* Follows Data-Driven Design architecture
    * Entity
    * Repository
    * Mapper
    * Query

???

* Entity = model, without persistence or validations
* Repository = mostly like class methods on an AR model class
    * Allows easily changing the storage layer
    * create, update, persist, delete
    * all, find, first, last
* Mapper = declaration of how to map DB records to object attributes

---

Hanami Model
===========

~~~ ruby
Hanami::Entity.configure do
  adapter type: :sql, uri: 'postgres://localhost/database'
  mapping do
    collection :articles do
      repository ArticleRepository
      entity Article
      attribute :id, Integer
      attribute :author, String
      attribute :text, String
      attribute :date, Date
    end
  end
end

Hanami::Entity.load!
~~~

---

Hanami Model
===========

~~~ ruby
class Article
  include Hanami::Entity
  attributes :author, :text, :date
end

class ArticleRepository
  include Hanami::Repository
  def self.for(name)
    query{where(author: name).order(:date)}
  end
end

article = Article.new(author: "Craig", text: "Hello", date: Date.today)
article = ArticleRepository.create(article)
ArticleRepository.find(12)
ArticleRepository.for("Craig")
~~~

???

* Inheriting from `Hanami::Entity` adds `id`, `id=`, `initialize`, plus `attributes` class method
    * That's **all** it adds!
    * Default initializer takes a hash of attributes to set the entity's attributes
* Persistence is done by the repository class

---

# Downsides of the Alternatives

* Everyone uses ActiveRecord
    * Have to learn something new
* Rails add-on gems assume you're using ActiveRecord

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
TODO: Recreate DITAA diagram from Ruby Preserves talk.

---
# Model with ActiveRecord

~~~ ruby
class User < ActiveRecord::Base
  has_many :roles
  scope :over_18, -> { where(age: 18..) }
end
~~~

---

# Model with ActiveRecord-Repository

~~~ ruby
class User
  include ActiveModel.entity()
  attribute :name, :string
  attribute :age, :integer
  has_many :roles
end
~~~

???

* I had `date_of_birth`, with a computed age, but the calendar math was too complex to show on screen

---

# Repository with ActiveRecord-Repository

~~~ ruby
class User::Repo
  include ActiveRecord.repository()
  scope :over_18, -> { where(age: 18..) }
end
~~~

---

# Controller with ActiveRecord

~~~ ruby
class UsersController
  def create
    user = User.create(params[:user])
    if user.save
      respond_with user
    else
      render :new, errors: user.errors
    end
  end
end
~~~

---

# Controller with ActiveRecord-Repository

~~~ ruby
class UsersController
  def create
    user = User.create(params[:user])
    if user.valid?
      User::Repo.save(user)
      respond_with user
    else
      render :new, errors: user.errors
    end
  end
end
~~~

???

* Only 2 lines change
* One caveat: validations can't check for uniqueness without a race condition
    * Would need to handle an exception on the `save` if you need uniqueness

---
class: single-image

![Thanks!](images/Thank You - word cloud.jpg)

---
class: single-image

![Weedmaps logo](images/Weedmaps.png)

---
class: single-image, cropped-square

![This Agile Life podcast logo](images/This Agile Life.jpg)

---

---

# TODO:

* The Active Record pattern
* What does an ORM do?
* Logos
    * Sequel: https://groups.google.com/forum/#!forum/sequel-talk
* Downsides of the alternatives
* Business logic vs domain model/logic
* The Repository pattern
* Using the Repository pattern with ActiveRecord
    * What does a controller look like?
        * Manually testing for valid?
        * Still checking for failures on save
            * Note that uniqueness (without race conditions) can only be done by the DB
* Fast tests (without stubs/mocks)!
* Future
    * Automatically-generated migrations
        * Mention Matt's talk on migrations
            * Following session, in 101F-H
* My implementation of the repository pattern with ActiveRecord
    * Really just an overview, showing the use of the ActiveRecord sub-modules
    * Challenges
    * Ask for help
* My affiliations:
    * This Agile Life
    * Weedmaps
* References:
    * My talk on Ruby Preserves
    * My talk on Ruby Idioms
    * Domain-Driven Design
        * https://www.amazon.com/dp/0321125215
        * by Eric Evans
