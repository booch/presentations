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

ActiveRecord - Pros
===================

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
* Probably some people that answered to both
* I hate ActiveRecord - mostly
* ActiveRecord is the 800-pount gorilla
* Odds are, if you're hired to work on Rails, you'll be using AR

---

ActiveRecord - Size
===================

* Rails is 270 kloc
* ActiveRecord is 210 kloc
* Adds about 300 instance methods
* Adds about 400 class methods

???

* LOC stats are from Sean Griffin, [Ruby Rogues episode 222][rr-222]
* kloc = 1000 lines of code
* Method stats are from a Rails 4.2 model w/ 1 field

---

Active Record Pattern
=====================

* Active Record pattern
* Data access logic in same class as domain logic
* Violates Single Responsibility Principle


* ActiveRecord ORM uses the pattern

???

* Note "Active Record" for the pattern and "ActiveRecord" for the ORM
* Active Record pattern described by Martin Fowler
  * [Patterns of Enterprise Application Architecture][peap]
* SRP violation is the biggest issue in my eyes
  * We'll see more of that later
  * The size is just a symptom of the SRP violation
* My feeling is that AR breaks down at about 20 model classes

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

* Probably the best alternative right now
* Good documentation
* Leverages database features
  * Like foreign key constraints
* Supports almost any SQL database you can think of
* Thread safety, connection pooling

???

* Biggest surprise when I did research for this talk last year
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
* Follows Data Driven Design architecture
  * Entity
  * Repository
  * Mapper
  * Query

---

ROM
===

* Should be the best alternative in the future
* Taking longer to get to 1.0 than hoped
  * Developers seem to be low-level / bottom-up types
* Previously DataMapper 2
  * But has diverged a **lot** since the name change
* Truly implements the Data Mapper pattern
* Supports SQL (via Sequel), MongoDB, YAML, HTTP

---

ROM
===

* Low-level pieces:
  * Axiom
  * ROM::Relation
  * ROM::Mapper
  * ROM::Session
  * Model
* Identity Map

---

Perpetuity
==========

* Worth looking at
* Simple
* Implements the Data Mapper patter
* Supports PostgreSQL, MongoDB, in-memory
* Identity Map

---

Mongoid and MongoMapper
=======================

* See Sarah Mei's essay on why to avoid MongoDB in most cases
* Mongoid
  * Pretty simple
  * Be sure to turn on MongoDB persistence!
  * Pretty stable
* MongoMapper
  * No longer well-maintained

???

* MongoMapper hasn't been updated much in 2 years
  * Still at version 0.13
  * No support for Ruby 2.2 or Rails 4.1+

---

No ORM
======

* POROs
* Sometimes you don't need persistence for all your models
  * TODO: Show examples
* MagLev

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
