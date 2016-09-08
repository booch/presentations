Stop Mocking Me!
================

* Track: Testing
* Audience: Intermediate, Advanced


Abstract (public, 600 characters)
--------

Ruby's got several mocking frameworks to choose from,
providing all kinds of test doubles — stubs, mocks, spies, and more.
But one kind of test double gets less attention: fakes.
You don't even need a mocking framework to use fakes effectively.

In this talk, we'll take a closer look at fakes,
and how they compare to the other test doubles.
We'll find some places where stubs and mocks are overused,
and explore how fakes can provide a better solution.


Details (outlines, outcomes, intended audience, etc.)
-------

I want to get people thinking about ways to simplify their tests using "plain old Ruby" code.

* Testing without test doubles
    * Examples
* Stubs
    * Full stubs
    * Partial stubs
    * Advantage: Isolation from dependencies
    * Examples
* Mocks
    * Advantage: Verifies OOP message-passing
    * Advantage: Encourages "tell, don't ask"
    * Disadvantage: Breaks Arrange-Act-Assert
    * Disadvantage: We don't often need to verify calls
    * Disadvantage: Too easy to closely mirror the code
    * Examples
* Spies
    * Advantage: Verifies OOP message-passing
    * Advantage: Allows proper AAA
    * Disadvantage: Still too easy to mirror the code
    * Examples
* Fakes
    * Advantage: Plain old Ruby
    * Advantage: Encourages more modular designs
    * Advantage: Encourages fewer collaborators
    * Disadvantage: Usually more code than a double
    * Examples
* Dependency injection
    * Not so common in Ruby
    * Not such a big deal in Ruby
        * Optional arguments
    * Examples using DI to inject fakes
    * DI frameworks - yuck! why?


Pitch (why this talk, why me?)
-----

I've noticed myself and several colleagues following a similar progression in their use of mocking.
When we first discover stubbing, we gradually increase our use of stubs, eventually to the point of overuse.
Then we start rejecting stubs and mocks for a while, and focus on reducing the number of collaborators.
That's great, but we all seem to have overcompensated in our reduction in the use of test doubles.
And when we came back to using more test doubles, we started using fakes more frequently.

This talk is intended to help attendees accelerate that learning path.

I've checked the talks from previous years to see what's been covered recently.
Justin Searls mentioned test doubles in his "How to Stop Hating your Test Suite" talk last year,
but only as a small portion of the talk.
Sam Phippen talked about various test doubles in 2014, but focused on spies,
and didn't really mention fakes.
Gregory Moeck touched on fakes a little in "Why You Don't Get Mock Objects" in 2011.
He's got some good important things to say about mocks that I'll need to keep in mind.
The closest thing I could find talking extensively about fakes would be
Justin Searls' "To Mock or Not to Mock" from Rocky Mountain Ruby 2012.
I'll be covering much of the same material, but from a different perspective,
and focusing more on fakes.
(In the interest of anonymity, I'm not claiming to be any of those people,
but I'm not claiming to NOT be any of those people, either.)


Bio
---

Craig is an independent consultant specializing in helping teams improve the way they work — both their processes and their technical practices. He works as an Agile player/coach on Rails rescue projects, DevOps automation, and anything else he finds interesting.

Craig started using Ruby and Rails in late 2005, and found a home in the framework, the language, and the community.

When he's not coding, Craig enjoys canoeing, attending concerts, traveling, and beekeeping.


Previous Pertinent Talks
------------------------

* [How to Stop Hating your Test Suite by Justin Searls](http://confreaks.tv/videos/rubyconf2015-how-to-stop-hating-your-test-suite)
* [An Introduction to Spies in RSpec by Sam Phippen](http://confreaks.tv/videos/rubyconf2014-an-introduction-to-spies-in-rspec)
* [To Mock or Not to Mock by Justin Searls](https://confreaks.tv/videos/rockymtnruby2012-to-mock-or-not-to-mock)
* [Why You Don't Get Mock Objects by Gregory Moeck](https://www.youtube.com/watch?v=R9FOchgTtLM)
* [Fake It Til You Make It: Unit Testing Patterns With Mocks and Fakes by Brian K. Jones](https://www.youtube.com/watch?v=hvPYuqzTPIk)
* [Stop Mocking, Start Testing by Augie Fackler, Nathaniel Manista](https://www.youtube.com/watch?v=Xu5EhKVZdV8)


Other Notes
-----------

* "Mock only what you own"
* "Don't mock the class under test"
* "Mock roles, not objects"
