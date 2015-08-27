Ruby Preserves
==============


Abstract
--------

How simple can we make an Object-Relational Mapper (ORM) that's still useful?
What if we just used SQL, instead of trying to hide it from developers?

I decided to find out.

In this presentation, we'll explore a simple ORM that uses the Repository and Data Mapper patterns.
We'll also see how using these patterns enables us to write simpler model code.


Details
-------

I decided to start writing my own ORM last year, just as an experiment.
I wanted to see how simple an ORM I could make.
In just a couple hundred lines, I had something that more or less worked.

My ORM is based on a few strong opinions:

* The Data Mapper pattern is generally better than the Active Record pattern.
* Declaring attributes in the domain model is better than hiding them elsewhere.
* Declaring relationships in one place and attributes in another is true madness.
* Projects are unlikely to need to abstract SQL to allow them to use different RDBMSes.
* The complexity of a typical ORM isn't much of an improvement over raw SQL.

This topic should be of interest to intermediate and advanced Rubyists.


Pitch
-----

I want to get a couple points across:

* An ORM doesn't have to be full of magic; you can understand how one works.
* The Data Mapper and Repository patterns make writing model code simpler and easier.
* Your tests will run quicker if you use these patterns to adhere to the Single Responsibility Principle.

Basically, I'll do whatever it takes to get people to consider alternatives to ActiveRecord.

I love speaking at local user groups.
Last year I got to give my first conference talk at RubyConf.
I was very nervous at first, partly because I chose an advanced topic.
But I loved the experience, and have had the chance to speak at a few conferences this year.
I'm hoping to speak at RubyConf again, since it's the community that I most identify and connect with.


Bio
---

Craig is an independent consultant specializing in Ruby, Rails, Rails rescue projects, DevOps, and Agile techniques.
Craig started using Rails in late 2005, and found a home in the framework, the language, and the community.

When he's not coding, reading about coding, or thinking about coding,
Craig enjoys canoeing, attending concerts, and traveling.
