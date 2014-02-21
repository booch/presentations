Alternatives to ActiveRecord
============================

Abstract
--------

Do you frequently get frustrated with ActiveRecord?
Are your tests taking too long to run?
Are your models trying to do too much?
Is there a better way?

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
but as your project grows, you'll start to see problems.
I think the sweet spot for ActiveRecord is applications with less than
20 models.

Because persistence and behavior are combined in a single class,
it's hard to write fast tests for models. That pain is telling us something.
I believe it's telling us that there's a better way.

I'm also frequently frustrated by having to look in the model for some
details and the schema for others. It's just not DRY enough.

DataMapper was an excellent alternative, but has not seen active
development for 2 years. I've recently gotten involved with the ROM and
Perpetuity ORMs, and have written some plugins to make dealing with 
ActiveRecord easier.

While gathering research for a version of this presentation for my local
Ruby users group, I found that Sequel is a great alternative that's
definitely worth considering. I'm planning to try it out on my next side project.