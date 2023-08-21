# Workshop: Relentlessly Refactoring Ruby

* Level: intermediate
* Category: tech skills
* Talk type: interactive workshop
    * 2 hours (with a 15-minute break)
    * practice skills
        * mix of presentation materials and hands-on exercises
    * workshops are not recorded

## Title Ideas

Ideally catchy, interesting, essence of the talk.

* Ruthlessly Refactored Ruby
* Ruthlessly Refactoring Ruby
* Relentlessly Refactoring Ruby
* Less Ruby > More Ruby
* The Less Code, The Better
* Smaller: Ruby Edition
* Less Ruby

## Abstract (Description)

[Publicly viewable. A concise, engaging description for the public program.
Please keep it short and punchy.]

As I've learned to improve the way I work, I've discovered that
almost everything we do should be done in smaller increments.
We would benefit from smaller features, smaller "tickets", smaller classes,
smaller methods, smaller commits, and smaller releases.

Sandi Metz gave us some good rules to tell us WHEN to refactor
to smaller classes and methods.
In this workshop, we'll practice the HOW.
We'll learn about code smells and refactoring, then practice using them.

## Details

I plan to start with a brief introductory presentation:

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
* Refactoring user stories ("tickets")
    * Thin vertical slices
    * Story splitting
        * Example of stories for a login form
    * One acceptance criteria per story
        * Using Gherkin notation
        * ACs should be at an appropriate (intermediate) level of detail
    * INVEST
* I like Agile techniques because they help me focus
    * It's easier to focus on smaller things
    * We get bored when we work too long on a single thing

The bulk of the workshop will involve practicing refactoring
Ruby application code.
I've previously worked with many of the examples I'll be using.
Many of the examples come from [Exercism](https://exercism.org/tracks/ruby/exercises).

### Learning Outcomes

* Smaller increments help us focus at every level
* Determining when to consider refactoring
* Techniques to help write more readable code
* Techniques for refactoring to smaller methods and classes

## Pitch (why this talk, why I'm qualified to speak on the topic)

I've given a similar workshop at an Agile Tech conference a few years ago.
That went over well with the audience.
Those code samples were in various languages;
this workshop will include only Ruby-specific examples.

I've also given a version of the workshop at a local Ruby meetup,
and a talk-only variation to my current Rails dev team.

I've been working with Rails since 2005.
The Ruby community — among others — got me interested in Agile and Extreme Programming.
I co-hosted a podcast called [This Agile Life](https://podcasts.apple.com/us/podcast/this-agile-life/id549367028) for several years.
I love helping developers improve their Agile practices and technical skills.

## Notes

Other possible titles:

* Relentlessly Refactoring Ruby
* Less Ruby > More Ruby
* The Less Code, The Better
