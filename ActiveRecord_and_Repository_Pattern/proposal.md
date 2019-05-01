ActiveRecord, the Repository Pattern, and You
=============================================

Track: ActiveRecord Wizardry


## Abstract

ActiveRecord is big. You just won't believe how vastly, hugely, mind-bogglingly big it is.
It does a lot. Many would say it does too much.
For me, the biggest issue is that it combines 2 distinct pieces of functionality —
modeling the domain, and abstracting database access.

For years, I've dreamed of separating these 2, while still staying on Rails' golden path.
I finally found a way to do that.
The benefits are high: faster tests, simpler code, decoupling from the database, automatic schema migrations —
without much downside.
Let's take a look and see if it might be for you and your project.


## Details

I've never quite been happy with ActiveRecord.
It's easy to get started, but as your project grows, you'll start to see problems.
Because persistence and behavior are combined in a single class, it's hard to write fast tests for models.
That pain is telling us something.
I believe it's telling us that there's a better way.

So I've been searching for a good way to separate those concerns for nearly a decade.
It finally hit me one morning — I might be able to do this using the various sub-modules that ActiveRecord is made up of.

This talk will cover the following:

* What does an ORM do?
* The Active Record pattern
* ActiveRecord
* Alternatives to ActiveRecord:
    * Sequel
    * ROM.rb
* Downsides of the alternatives
* The Repository pattern
* Using the Repository pattern with ActiveRecord
* My implementation of the repository pattern with ActiveRecord
    * Really just an overview, showing the use of the ActiveRecord sub-modules
* Fast tests!


## Pitch

There's a lot of architectural advice telling you to separate the domain model from the database.
That's great, but it's really difficult to stray from ActiveRecord when building a Rails app.
That's why I've been looking a long time for a way to do that with ActiveRecord.
When I finally figured out how to do it, I wanted to show the whole world.
It took some effort to work out the details, but so far, I'm happy with the results.

The project is still pretty rough, but I've got the proof-of-concept working,
and will have a couple months to polish it up before showing it off.

I've spoken about Ruby ORMs at conferences before, among other topics.
The Ruby and Rails community is the one that I most identify and connect with.
