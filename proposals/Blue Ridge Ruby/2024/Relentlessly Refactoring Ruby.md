# Relentlessly Refactoring Ruby

* Level: intermediate
* Talk type: 30-minute lecture-style

## Elevator Pitch (300 characters)

This started as a workshop at an Agile Tech conference a few years ago.
It went over well with the audience, and at a local Ruby meetup more recently.
I've given a talk-only variation to my current Rails dev team.
I think it helps devs write better, more concise, more readable code.

## Description

As I've learned to improve the way I work, I've discovered that
almost everything we do should be done in smaller increments.
We would benefit from smaller features, smaller "tickets", smaller classes,
smaller methods, smaller commits, and smaller releases.

Sandi Metz gave us some good rules to tell us WHEN to refactor to smaller classes and methods.
In this talk, I'll show the HOW.
We'll learn about code smells and refactoring,
and see how they can help us write better code.

## Details

I plan to adapt a [presentation I've given as part of a workshop](https://booch.github.io/presentations/Smaller/slides.html#p1):

* What is refactoring?
* Why refactor?
    * "Reduce the cost of software"
    * Readability
    * Simplification
        * DRY - Don't Repeat Yourself
        * SRP - Single Responsibility Principle
    * Improved extensibility
    * Maintainability
    * Reduced bugs
    * Improved performance - shorter code usually runs faster
        * Does less
        * Fits in cache better
* When to refactor
* What do I need to be able to refactor?
* Refactorings have names
    * Example refactorings
* Code smells indicate that you need to refactor
    * Some example code smells
    * Smells have names
    * Tests can have smells as well
* Sandi Metz's rules
    * Classes should be no longer than 100 lines of code
    * Methods should be no longer than 5 lines of code
    * Pass no more than 4 parameters into a method
    * Break these rules only if you have a good reason and your pair agrees
* Four Rules of Simple Design
    * Passes the tests
    * Reveals intention
    * No duplication
    * Fewest elements
* Relentless refactoring
    * Examples of extracting classes
    * Examples of extracting methods
    * Most methods should end up with only 1 or 2 lines of code

I've previously worked with many of the examples I'll be using.
Others come from [Exercism](https://exercism.org/tracks/ruby/exercises).

### Other possible titles

* Relentlessly Refactored Ruby
* Ruthlessly Refactored Ruby
* Less Ruby > More Ruby
* The Less Code, The Better
* Smaller: Ruby Edition
* Less Ruby

## Other Notes

* I like Agile techniques because they help me focus
    * It's easier to focus on smaller things
    * We get bored when we work too long on a single thing
