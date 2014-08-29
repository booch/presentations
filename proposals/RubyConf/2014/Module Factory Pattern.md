The Module Factory Pattern
==========================

Abstract
--------

Why do so many modules have a class method to configure them?

~~~ ruby
class Foo
  include ActsAs::Bar
  acts_as_bar baz: true
end
~~~

Why can't we just pass parameters along with the `include` statement?
Ruby doesn't allow passing extra parameters in an `include`,
but recently I noticed a pattern that makes it possible to do what we want:

~~~ ruby
class Foo
  include ActsAs::Bar.new(baz: true)
end
~~~

This use of meta-programming solves the problem elegantly, but hasn't seen much uptake yet.
We'll explore this pattern in depth, and see how we can best take advantage of it.


Details
-------

* What's the name of this thing?
  * Parameterized module inclusion
  * Module factory pattern
* Is it a pattern or an idiom?
  * What's the difference?
* How to use a module that uses the pattern.
* How to use the pattern for your own modules.
* Examples from Virtus and my own code.
* Variations
  * include ActsAs::Bar.new(baz: true)
  * include ActsAs::Bar(baz: true)
  * include ActsAs.Bar(baz: true)
  * include ActsAs.bar(baz: true)
* Idioms and patterns don't come from "on high"
  * Sometimes we discover new ones.


Pitch
-----

I discovered this pattern about a year ago being used in Virtus, after looking for such a solution for several years.
I wrote up a blog post on it earlier this year, and started using it in a few places.
I've also spoken about it at the local Ruby user group.

I'd like to promote the use of this idiom.
But I'd also like to get people thinking about idioms in general, and the idea that we can come up with new ones.
