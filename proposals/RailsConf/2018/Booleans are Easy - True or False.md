Booleans are Easy - True or False?
==================================

Track: Reconsidering the Basics


Abstract
--------

Booleans are pretty simple — they're either true or false.
But that doesn't mean that they're always easy to use, or that they're always the right choice when they appear to be the obvious choice.

We'll cover several anti-patterns in the use of booleans.
We'll discuss *why* they're problematic, and explore some better alternatives.


Details
-------

I'd like to start with a good example of a boolean used poorly in an API Ruby:
If you're in IRB and have the class of an object, you can see what methods that class has using the `methods` method.
The `methods` method takes an optional boolean to specify whether you want to include methods from superclasses,
or just the ones defined in the class itself.
But I (and many people) can never remember whether you have to pass `true` or `false` to get that behavior.
So using a boolean in the method signature actually causes a loss of information for the user.
And it gets worse if your method takes more than 1 boolean. What order do they go in, again?
The solution here is to use a named parameter.
(I recall Avdi and Sandi recommending using an option Hash in older Ruby versions.)

Another place where booleans can be problematic is in maintaining the state of an object.
We'll often have several boolean states in an object.
Those states usually don't overlap much,
so an object being in an "editing" state might make the "saved" state meaningless.
This is a case where ActiveRecord::Enum might a better choice -- or one of the state-machine gems.

Other points to cover:

* Primitive Obsession code smell
* "Boolean Blindness"
    * A boolean often obscures the context that it represents
* Booleans often indicate a Single Responsibility Principle violation
    * As an argument, it says "this method does one thing or another thing"
    * Might indicate a place where we should use polymorphism
* Multiple booleans cause exponential of complexity
    * If you have `n` booleans, you have to cover `n^2` cases
* De Morgan's laws
    * A couple examples where several booleans are used, creating confusion
        * Refactoring to extract methods for sub-expressions
        * Using De Morgan's laws to simplify
* Preventing representation of invalid states
* Null Object pattern
    * Refer to Sandi Metz' great talk on the subject
* Avdi's "confident code" principle
* Confusing meaning of check-boxes in UIs

This talk should appeal to Rubyists of any experience level.

I'm not 100% sure if this should be in the "Reconsidering the Basics" or in the general track.


Pitch
-----

The best talk I saw at Strange Loop 2017 was actually at Elm-Conf on the pre-conference day.
It was "Solving the Boolean Identity Crisis" by Jeremy Fairbank from Test Double.
It was a talk about booleans in Elm, but a large portion of the content is pertinent to almost any language.
The fact that he was able to talk so extensively about booleans was kind of impressive.

I'd like to bring the essence of that talk to Ruby-land.
(I was already thinking about how I'd do that while watching Jeremy's talk.)
There will be differences, obviously.
Elm has static types and union types that can be used, whereas Ruby would use symbols in such cases.
So the talk can't be simply "ported" to Ruby; it will have to take Ruby's idioms into consideration.

The larger point to drive across is that readability matters,
and there are things that we can do to help our teammates.
I love the way Jeremy ends his talk, commenting on empathy and compassion for our fellow coders.


Bio
---

Craig has been using Ruby and Rails since 2005. He enjoys coding, and Ruby increases that enjoyment.
In addition to development work, he specializes in helping teams improve the way they work —
through technical practices, processes, and automation.

If you want to make small talk, ask Craig about attending concerts, traveling, canoeing, or beekeeping.


References
----------

* [Solving the Boolean Identity Crisis by Jeremy Fairbank](https://www.youtube.com/watch?v=8Af1bh-BVY8)
    * [Slides for "Solving the Boolean Identity Crisis"](https://bit.ly/elm-bool)
* [Boolean Blindness](https://existentialtype.wordpress.com/2011/03/15/boolean-blindness/) article
* "Don't Make Me Think" by Steve Krug
* "The Humane Interface" by Jef Raskin
