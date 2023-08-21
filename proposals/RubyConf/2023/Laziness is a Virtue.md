# Laziness is a Virtue

* NOTE: This is an update of a proposal for RailsConf 2018.
    * Another proposal of mine was accepted.

## Metadata

* Audience level: intermediate
* Category: tech skills
* Talk type: lecture-style
    * 30-45 minutes

## Title

* Laziness is a Virtue

## Abstract

We can write Ruby code in any number of styles,
but the community has some accepted norms.
For example, almost nobody uses `for` loops any more.
We've decided that some styles are "better" than others.
And we can keep finding "better" styles.

In this talk, we'll dig into a more functional "lazy" style.
Instead of setting up variables ahead of time,
we'll call methods as needed.
Instead of thinking about how to compute things,
we'll think about properties of objects.
This style has improved the readability of my code,
and it will help you too.

## Details

This will mainly focus on code examples,
showing the common "old" way and the "lazy" way,
focusing on the differences, pro and con.

Here's a basic outline of what I plan to cover.
I'll be working through example code, analyzing different scenarios.
So the actual talk will involve some skipping around - and some reinforcement.

* What does "better" mean?
* Benefits of laziness
    * No code is run unless/until the value is needed
    * Code is more readable
        * Less thinking about how to "set" and "get" data
        * Less thinking about "how" to compute results
            * More thinking about what results you want
        * Declarative style
* How to use laziness
    * Memoization
    * Complex scenarios
* Benefits of declarative style
* When (and how) NOT to be lazy
    * Problems with laziness
    * The order in which lazy code runs can be very surprising
    * When the order of side effects matters, laziness is harmful
* Knowing when to "ask" and when to "tell"
    * OOP says to always "tell"
    * FP says to always "ask"
    * Ruby is booth OOP and FP

This talk should appeal primarily to intermediate and junior developers.


## Pitch

I've been using Ruby and Rails since 2005.
Over that time, I've learned a lot, and my style and idioms have changed a lot.
The community has evolved as well.

There's a branch of the community that's very much into immutability and functional programming.
I'm between that branch and the main-line branch, finding benefits in the functional approach,
but being a bit less dogmatic about it.

I'd love to share this approach with more people.
It's a great tool to get shorter, more readable code.
It's also a way to get people to think differently about their problems.
It's always good to have more tools in our toolbox for how to think about solving problems.

I've given several talks of a similar type
— a thorough deep-dive into a technical topic — at conferences.
I also have a lot of experience giving similar talks at local dev meetups.

This talk will be relatively code-heavy.
I'll have to work to keep it from being too dry.
I'm planning to get some help from "Instantly Better Presentations" by Damian Conway, among other resources.

## Examples

* Several real code examples from Rails apps I've encountered
    * Before and after I refactored them
* RSpec `let` (and the difference from `let!`)
