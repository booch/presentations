Testing Patterns You're Not Using Yet
=====================================

* Track: Testing
* Audience: Intermediate, Advanced


Abstract (public, 600 characters)
--------

Most of us are familiar with design patterns.
But we don't usually think of patterns when we're writing tests.
That's too bad, because there are a lot of useful testing patterns.
We'll explore some of the patterns that aren't used much in Ruby (yet):

* Spies
* Page Objects
* Property testing
* Mutation testing
* Smoke testing


Details (outlines, outcomes, intended audience, etc.)
-------

I plan to talk about several testing patterns that are less familiar to folks:

* Spies
    * Solving the Arrange-Act-Assert problem
* Page Objects
    * Using more OOP in tests
* Property testing (generative tests)
* Mutation testing
    * True code coverage
* Running the same tests in different ways
    * Smoke tests
* Tagging tests to run subsets
    * Focusing on the current test
* Given-When-Then
    * In Cucumber
    * In RSpec
* Custom RSpec matchers

Some other points I'll cover along the way:

* Testing pyramid
* TDD to drive design
* BDD
* RSpec let, let!, and subject
* RSpec is_expected.to
* RSpec-its

While the talk won't be RSpec-specific, most of my examples will use RSpec,
as that's what I'm most familiar with.


Pitch (why this talk, why me?)
-----

I believe each of these topics (other than property testing) have been covered at least a little at previous RubyConfs.
The main difference in this talk will be the focus on thinking about patterns,
as well as covering some techniques that haven't been covered extensively.
I've previously given conference talks on patterns, which seemed to be well received.
I think helping people think about testing patterns will help them write better tests.


Bio
---

Craig is an independent consultant specializing in helping teams improve the way they work — both their processes and their technical practices. He works as an Agile player/coach on Rails rescue projects, DevOps automation, and anything else he finds interesting.

Craig started using Ruby and Rails in late 2005, and found a home in the framework, the language, and the community.

When he's not coding, Craig enjoys canoeing, attending concerts, traveling, and beekeeping.


Resources
---------
