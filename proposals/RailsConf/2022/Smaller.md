Smaller!
========

Type: Workshop
Track: General


Abstract (public, 600 characters)
--------

As I've learned to improve the way I work,
I've discovered that almost everything we do should be done in smaller increments. We would benefit from smaller stories, smaller classes, smaller methods, smaller commits, smaller releases.

Sandi Metz gave us some good rules to tell us WHEN to refactor to smaller files, classes, and methods. In this workshop, we'll practice the HOW. We'll learn about code smells and refactoring, then practice using them.

Details (outlines, outcomes, intended audience, etc.)
-------

Intended Audience: Beginner, Intermediate

I plan to start with a brief introductory presentation:

* I like Agile techniques because they help me focus
    * It's easier to focus on smaller things
    * We get bored when we work too long on a single thing
* Minimum Viable Feature
* Story splitting
    * Example of stories for a login form
    * One acceptance criteria per story
* Thin vertical slices of stories
* Single Responsibility Principle
* Smaller code usually runs faster
    * Does less
    * Fits in cache better
* Refactorings have names
* Sandi's rules
* Smells indicate that you need to refactor
    * Smells have names
    * Tests can have smells as well

The bulk of the workshop will involve practicing refactoring Rails application code.


Learning Outcomes
-----------------

* Smaller increments help us focus at every level
* Determining when to consider refactoring
* Techniques to help write more readable code
* Techniques for refactoring to smaller methods and classes
* Writing smaller stories


Pitch (why this talk, why me?)
-----

I've given a similar workshop at an Agile Tech conference a few years ago. That went over well with the audience. Those code samples were in various languages; I'll tailor this workshop with Ruby- and Rails-specific examples.

I've also given a workshop at RailsConf, so I'm aware of the constraints.

I've been working with Rails since 2006. The Ruby community — among others — got me interested in Agile and Extreme Programming. I love to help more developers improve their Agile practices in useful ways.


Bio
---

Craig has been using Ruby and Rails since 2005. He enjoys coding, and Ruby increases that enjoyment. In addition to development work, he specializes in helping teams improve the way they work — through technical practices, processes, and automation.

If you want to make small talk, ask Craig about attending concerts, traveling, canoeing, or beekeeping.


---



Other
-----

I'll probably work my way through the areas in the same order they're normally addressed in an Agile work flow:

* Stories
* Tests
* Classes
* Methods
* Commits
* Releases

* Sandi Metz' rules:
    * Classes can be no longer than one hundred lines of code
    * Methods can be no longer than five lines of code
    * Pass no more than four parameters into a method
    * Controllers can instantiate only one object
    * Break these rules only if you have a good reason and your pair lets you

Of course there are some exceptions to the rules, where smaller is not better:

* Documentation
* Commit messages