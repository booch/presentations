# Functionally Functional

## Metadata

* Audience level: intermediate
* Category: tech skills
* Talk type: lecture-style
    * 30-45 minutes

## Title

* Functionally Functional

## Abstract

Ruby is a pure OOP language.
Ruby is also an FP language.
We get to choose when to use OOP and when to use FP.
How should we make that decision?

We'll look at several scenarios,
investigating the pros and cons of OOP and FP in each scenario.
We'll see how immutability can be used in combination with FP,
to make our code more understandable.
Learning how to use a balance of FP and OOP has improved the readability of my code,
and it will help you too.

## Details

I'll mainly focus on code examples,
showing the more "traditional" Ruby way and a more FP way.
I plan to thoroughly investigate the pros and cons of each,
where they differ.

Here's a basic outline of what I plan to cover.
I'll be working through example code, analyzing different scenarios.
So the actual talk will involve some skipping around - and some reinforcement.

* Benefits of FP
    * Code is more easily tested
    * Code is more easily understood
    * No side effects
        * Have to be careful to ensure this in Ruby
            * There's no way to enforce it, in most cases
    * Code is more readable
        * Less thinking about how to "set" and "get" data
        * Less thinking about "how" to compute results
            * More thinking about what results you want
* Immutability
* Difficulties of FP
    * Real-world programs have I/O
        * Lots of coordination between systems that mutate each others' state
    * The order in which lazy code runs can be very surprising
        * When the order of side effects matters, laziness is harmful
    * We can't easily enforce immutability in Ruby
* Knowing when to "ask" and when to "tell"
    * OOP says to always "tell"
    * FP says to always "ask"
    * Ruby is both OOP and FP

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

This talk will be relatively code-heavy.
I'll have to work to keep it from being too dry.
I'm planning to get some help from "Instantly Better Presentations" by Damian Conway, among other resources.

## Examples

* Several real code examples from Rails apps I've encountered
    * Before and after I refactored them
