Laziness is a Virtue
====================

Track: Reconsidering the Basics


Abstract
--------

You can write your Ruby code in any number of styles, but the community has some general norms.
For example, almost nobody uses `for` loops any more.
So we've decided that some styles are "better" than others.
And we can keep finding better styles.

In this talk, we'll discuss a "lazy" style.
Instead of thinking about how to compute things, we think about properties of objects.
Instead of setting up instance variables ahead of time, we call methods as needed.
This style has improved the readability of my code, and it will help you too.


Details
-------

This will mainly focus on code examples, showing the "old" way and the "lazy" way,
and focusing on the differences, pro and con.

Here's a basic outline:

* Benefits of laziness
    * No code is run unless/until the value is needed
    * Code is more readable
        * Less "do", "set", "get" cluttering up your code
* Examples
    * Several real code examples from Rails apps I've encountered
        * Before and after I refactored them
    * RSpec `let` (and the difference from `let!`)
* Memoization
* When (and how) NOT to be lazy

This talk should appeal primarily to intermediate and junior developers.


Pitch
-----

I've been using Ruby and Rails since 2005.
Over that time, I've learned a lot, and my style and idioms have changed a lot.
The community has evolved as well.

There's a branch of the community that's very much into immutability and functional programming.
I'm between that branch and the main-line branch, finding benefits in the functional approach,
but being a bit less dogmatic about it.

I'd love to share this approach with more people.
It's a great tool to get shorter, more readable code.
But it's also a way to get people to think differently about their problems.
And it's always good to have more tools in our toolbox for how to think about solving problems.

This talk will be relatively code-heavy.
I'll have to work to keep it from being too dry.
I'm planning to get some help from "Instantly Better Presentations" by Damian Conway, among other resources.


Bio
---

Craig has been using Ruby and Rails since 2005. He enjoys coding, and Ruby increases that enjoyment.
In addition to development work, he specializes in helping teams improve the way they work —
through technical practices, processes, and automation.

If you want to make small talk, ask Craig about attending concerts, traveling, canoeing, or beekeeping.
