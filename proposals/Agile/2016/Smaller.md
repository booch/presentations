Smaller!
========


Presenter: Craig Buchek
Track: Development Practices & Craftsmanship
Type: Talk
Audience Level: Practicing
Room Setup: No Preference
Duration: 75 minutes
Keywords: Refactoring UserStories


Abstract
--------

As I've learned to improve the way I work,
I've discovered that almost everything we do needs to be smaller.
We would benefit from smaller stories, smaller classes, smaller methods,
smaller commits, smaller releases.

In this talk, we'll explain why smaller is better and how to get there.


Learning Outcomes
-----------------

* How smaller helps us focus at every level
* Techniques to help write more readable code
* Techniques for refactoring to smaller functions/methods/classes
* Writing smaller stories
* Saving time on estimating with smaller stories


Prerequisite Knowledge
----------------------

Attendees should be familiar with some basic Agile concepts:

* User stories (or something similar)
* Story points
* Refactoring (at least the concept)
* Iterations

About half the talk will involve code and refactoring,
so attendees should have some experience with coding.


Information for Program Team
----------------------------

I'll probably work my way through the areas in the same order they're normally addressed in an Agile work flow:

* Stories
* Classes
* Methods
* Commits
* Releases

I may throw Tests in as well.

Some things I plan to cover:

* Agile techniques help me focus
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
* Relentless refactoring
    * Examples of extracting classes
    * Examples of extracting methods
* Test smells (or pain) indicating that you need to refactor
* Sandi Metz' rules for Ruby code
    * Classes can be no longer than one hundred lines of code
    * Methods can be no longer than five lines of code
    * Pass no more than four parameters into a method
    * Controllers can instantiate only one object
    * Break these rules only if you have a good reason and your pair lets you
* Continuous integration
* Continuous delivery (how to incrementally get there)
    * Build confidence with the customers
    * Release bug fixes "out of band"
    * Show that smaller changes are less risky
    * Keep decreasing time between releases


Of course there are some exceptions to the rules, where smaller is not better:

* Documentation
* Commit messages


Presentation History
--------------------

I've given mostly technical talks.
I've given presentations at RubyConf 2015, RubyConf 2016, and Madison+ Ruby 2015.
I gave a workshop at RailsConf 2015.

I've given numerous talks on a wide range of topics at local user groups,
including Ruby, Agile, and GNU/Linux groups.

Because my talks are usually quite technical,
I fall victim to slides with too many bullet points.
(As you can see above, I tend to think in bullet points.)
I'm working to improve that with more pictures and diagrams in future talks that I'm working on.


Presentation Sample
-------------------
