# Relentless Refactoring

## Description (seen by attendees)

As I've learned to improve the way I work, I've discovered that almost everything we do should be done in smaller increments. We would benefit from smaller features, smaller "tickets", smaller classes, smaller methods, smaller commits, and smaller releases.

Sandi Metz gave us some good rules to tell us WHEN to refactor to smaller classes and methods. In this talk, I'll show the HOW, and take it to its limits — refactoring until we can't refactor any more. We'll look at catalogs of code smells and refactorings, finding how we can best write high-quality code that is readable and maintainable.

## Details

This could be a talk or a workshop. I've done variants of both at local meetups. It started as a workshop at an Agile Tech conference years ago. It went over well with the audience, so I've rewritten much of it several times, and will continue to keep it up to date.

Outline of talk:

* What is refactoring?
* Why refactor?
    - "Reduce the cost of software"
    - Readability
    - Simplification
        - DRY - Don't Repeat Yourself
        - SRP - Single Responsibility Principle
    - Extensibility
    - Maintainability
    - Reduced bugs
    - Performance
    - It's easier to focus on smaller things
* When to refactor
* What do I need to be able to refactor?
* Refactorings have names
    - Example refactorings
    - Sites with lists of refactorings
* Code smells indicate that you need to refactor
    - Some example code smells
    - Smells have names
    - Tests can have smells as well
    - Sites with lists of smells
* Sandi Metz's rules
    - Classes should be no longer than 100 lines of code
    - Methods should be no longer than 5 lines of code
    - Pass no more than 4 parameters into a method
    - Break these rules only if you have a good reason and your pair agrees
* Four Rules of Simple Design
    - Passes the tests
    - Reveals intention
    - No duplication
    - Fewest elements
* Relentless refactoring
    - Examples of extracting classes
    - Examples of extracting methods
    - Most methods should end up with only 1 or 2 lines of code

For the workshop variant, I'll give the 30-minute talk, then provide several code exercises in Ruby (with my proposed solutions). I've previously worked with several of the examples; others come from [Exercism](https://exercism.org/tracks/ruby/exercises). Attendees will get lots of practice refactoring. I recommend working in pairs or small groups for more active learning. I'll be available to help with the exercises, and answer any questions.

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
