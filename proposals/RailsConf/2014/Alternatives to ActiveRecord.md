Alternatives to ActiveRecord
============================

Abstract
--------

ActiveRecord comes with Rails, and its easy to get started with it.
But as your project grows, you'll start to see some problems.
Tests will take too long to run. Models will try to do too much,
and you'll have a hard time dealing with the complexity.

There are a few good alternatives to ActiveRecord. We'll scan the landscape
and see when it might be a good idea to use one of those other ORMs. We'll
also look at some add-ons that will make ActiveRecord easier to deal with.


Details
-------

We'll start by talking about the disadvantages of ActiveRecord.
We'll then take a look at the main contenders: DataMapper, Sequel, Perpetuity, and ROM.
We'll briefly talk about NoSQL options (and no-DB options).
Then we'll wrap up by talking about why you still might decide to use 
ActiveRecord, and some ways to make that easier to deal with.

The take-away is that we've got options, whether that means using an
alternative to ActiveRecord, or making ActiveRecord easier to deal with.


Pitch
-----

I've never quite been happy with ActiveRecord. It's easy to get started,
but for larger projects, it tries to do too much. Because persistence and
behavior are combined in a single class, it's hard to write fast tests for
models. I'm also frequently frustrated by having to look in the model for
some details and the schema for others.

DataMapper was an excellent alternative, but has not seen active
development for 2 years. I've recently gotten involved with the ROM and
Perpetuity ORMs, and have written some plugins to make dealing with 
ActiveRecord easier.

While gathering research for a version of this presentation for my local
Ruby users group, I found that Sequel is a great alternative that's
definitely worth considering. I plan to try it out on my next side project.
