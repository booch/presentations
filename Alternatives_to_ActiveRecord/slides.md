class: title, middle, center

# Alternatives to ActiveRecord

* by Craig Buchek


* WindyCityRails
* September 17-18, 2015


http://tinyurl.com/ar-alt-wcr


---
layout: true

<footer>
  <p>@CraigBuchek</p>
</footer>

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

* Who here uses ActiveRecord?
* Who hasn't used ActiveRecord?
* Who loves ActiveRecord?
* Who hates ActiveRecord?
* Who both loves and hates ActiveRecord?
* I hate ActiveRecord - mostly
* But ActiveRecord is the 800-pount gorilla
* Odds are, if you're hired to work on Rails, you'll be using AR

---

ActiveRecord - Size
===================

* Rails is 270 kloc
* ActiveRecord is 210 kloc
* Adds about 300 instance methods
* Adds about 400 class methods

???

* ActiveRecord is **big**
* kloc = 1000 lines of code
* LOC stats are from Sean Griffin, [Ruby Rogues episode 222][rr-222]
* Method stats are from a Rails 4.2 model w/ 1 field

---

ActiveRecord - Insanity
=======================

* Attributes and relationships defined different places
  * Attributes are defined in DB schema
  * Relationships are defined in the model class
* Can be solved using new attributes API (Rails 5.0)

???

* True madness to have to look in 2 places for all details about a model
  * This is a case of too much magic for me
  * Work-arounds like model-annotations helped
* Attributes API actually debuted in Rails 4.2, but was not publicized
* I had also released a couple gems to define attributes in AR models
  * Virtus-ActiveRecord
  * ActiveRecord-AttributeDeclarations

---

Active Record Pattern
=====================

* Persistence logic in same class as domain logic
* Violates Single Responsibility Principle


* ActiveRecord ORM uses this pattern

???

* But it's not the size of ActiveRecord that's the biggest problem
  * The biggest problem is that it encourages bad engineering habits
    * This is mostly because it violates the SRP
    * The size of AR is just a symptom of the SRP violation
* Note "Active Record" is the pattern and "ActiveRecord" is the ORM
* Active Record pattern described by Martin Fowler
  * [Patterns of Enterprise Application Architecture][peap]
* Separation of concerns in important
  * Just like Rails separates M-V-C concerns
  * But ActiveRecord does a terrible job at it
* My experience is that AR breaks down at about 20 model classes
  * Data Mapper pattern has some advantages with only a few classes
    * But has a little more overhead in the number of classes/concepts

---

ORM
===

* Object-Relational Mapper (ORM)


* Connects your app to your database


* Ruby - objects
* SQL - relations

???

* SQL databases deal with relations
  * Relational algebra
* Caveat: there's an "impedance mismatch" between the 2 sides
* Some of the "ORMs" we'll look at don't actually do the mapping part

---

DataMapper
==========

* Actually uses the Active Record pattern
* Supports a lot more than just SQL on the back end
* No further development
  * Last updated 2012-08-27

???

* Seemed to be the best way forward for a few years

---

Sequel
======

* Good documentation
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

* Awesome feature - set a model to a subset of a table

~~~ ruby
DB = Sequel.connect("sqlite://blog.db")
class Post < Sequel::Model
  set_primary_key [:category, :title]
  set_dataset DB[:my_posts].where(category: "ruby")
    .select(:category, :title, :content).order(:date)
end
~~~

---

Lotus::Model
============

* Data Mapper pattern
* SQL (via Sequel), memory, and file adapters
* Version 0.4.1
* Follows Data-Driven Design architecture
  * Entity
  * Repository
  * Mapper
  * Query

---

ROM
===

* Ruby Object Mapper
* Started life as DataMapper 2
* Taking longer to get to 1.0 than hoped
  * But RC is just around the corner
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

* Developers really good at small, independent, low-level composable libraries
* Some of the leaders of the movement toward FP and immutability in Ruby
  * A bit focused on low-level details at times
  * End up taking longer than expected, but really high quality code

---

Perpetuity
==========

* Worth looking at
* Simple
* Implements the Data Mapper pattern
* Supports PostgreSQL, MongoDB, in-memory
* Identity Map

---

Mongoid and MongoMapper
=======================

* You probably should not be using MongoDB
  * See [Sarah Mei's essay][no-mongo]
* Mongoid
  * Pretty simple
  * Pretty stable
  * Be sure to turn on MongoDB persistence!
* MongoMapper
  * No longer well-maintained

???

* Sarah Mei's article basically says you'll need relations later
* And that the structure of your data has no value
  * Paints you into a corner with no references
* MongoMapper hasn't been updated much in 2 years
  * Still at version 0.13
  * No support for Ruby 2.2 or Rails 4.1+

---

No ORM
======

* POROs
* Defer persistence until last responsible moment
  * You might not ever get there
* MagLev

???

* POROs = plain old Ruby objects
* MagLev is a SmallTalk-derived Ruby implementation
  * It has object persistence built in - no DB required

---

My Preferences
==============

1. Lotus::Model
2. Perpetuity
3. ROM
4. Sequel
5. ActiveRecord with declared attributes

???

* This is the order I'd currently consider them, for my personal projects
  * Obviously, context matters a lot

---

Further Info
============

* [The State of Ruby ORM][state-of-orm] (2011)
* [DataMapper Retrospective][datamapper-retro] (2011)
* [Sequel is awesome and much better than ActiveRecord][sequel-awesome]
* [Why You Should Never Use MongoDB][no-mongo] (Sarah Mei)
* [ORM Hate][orm-hate] (Martin Fowler)
* [Turning the Tables: How to Get Along with your Object-Relational Mapper][turning-tables]

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


* Slides: http://tinyurl.com/ar-alt-wcr
* Slides: https://github.com/booch/presentations/


[rr-222]: http://devchat.cachefly.net/rubyrogues/transcript-222-rr-rails-5-with-sean-griffin-ruby-rogues.pdf
[peap]: http://www.amazon.com/Patterns-Enterprise-Application-Architecture-Martin/dp/0321127420
[no-mongo]: http://www.sarahmei.com/blog/2013/11/11/why-you-should-never-use-mongodb/
[state-of-orm]: http://solnic.eu/2011/11/29/the-state-of-ruby-orm.html
[datamapper-retro]: http://rhnh.net/2011/11/29/datamapper-retrospective
[sequel-awesome]: http://rosenfeld.herokuapp.com/en/articles/ruby-rails/2013-12-18-sequel-is-awesome-and-much-better-than-activerecord
[orm-hate]: http://java.dzone.com/articles/martin-fowler-orm-hate
[turning-tables]: https://medium.com/@bradurani/turning-the-tables-how-to-get-along-with-your-object-relational-mapper-e5d2d6a76573


[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[boochtek]: http://boochtek.com
[tal]: http://www.thisagilelife.com


[remark]: http://remarkjs.com/
