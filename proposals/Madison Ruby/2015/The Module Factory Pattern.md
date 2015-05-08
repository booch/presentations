The Module Factory Pattern
==========================

Description
-----------

It's always bothered me that we have to include a module and then configure it separately:

    include ActsAs::Bar
    acts_as_bar baz: true

Ruby doesn't allow passing arguments to include statements, but I recently found a pattern that makes it possible to do what we want:

    include ActsAs::Bar.new(baz: true)

This use of meta-programming solves the problem elegantly, but hasn't seen much uptake yet. We'll explore this pattern in depth, and see how we can best take advantage of it.


Why Me?
-------

When I found this idiom in the wild (in Virtus) it was the solution to a problem I'd been trying to solve for years. So I'm pretty passionate about it.

I'd like to cover this pattern in more depth than I have before, including variations on the theme:

    include ActsAs::Bar.new(baz: true)
    include ActsAs::Bar(baz: true)
    include ActsAs.Bar(baz: true)
    include ActsAs.bar(baz: true)

I'll cover how to implement the pattern, how to use it, and show a few examples.

I'd like to promote the use of this idiom. But I'd also like to get people thinking about idioms and patterns in general, and the idea that we can come up with new ones.

(Continued on back of form.)


Has This Talk Been Given Elsewhere?
-----------------------------------

I gave a talk on "Ruby Idioms You're Not Using Yet" at RubyConf 2014, that included this idiom among several others. This is my favorite, and the one that inspired that talk.

