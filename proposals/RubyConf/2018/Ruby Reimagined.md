Ruby Reimagined
===============

Abstract
--------

Ruby's got a great design — its features seem to fit together really well.
Most importantly, it's a joy to work with.
But there's always room for improvement.

What would Ruby look like if we redesigned it today?
What features would we leave out?
What features would we add?
What ideas would we borrow from other languages?

This is primarily a thought experiment,
but perhaps we can work to get some of the ideas added to a future version of Ruby.


Details
-------

I'll start by talking about how Ruby makes me very happy.

I'll go over quite a few possible features that could be added to Ruby.
For each feature, I'll talk about:

* What the feature is, and how it would be used
* Where it comes from
* Whether it might fit well with Ruby
* The likelihood of it actually making it into Ruby
* How it might look in Ruby

Features that I'm likely to talk about:

* Immutable strings
* Immutable arrays and hashes
* Static null checking (like Crystal)
* Crystal's solution to HashWithIndifferentAccess
* Auto-initializing variables (`@` in parameters list, like CoffeeScript and Crystal)
* First-class blocks (passing multiple blocks to a method, etc.)
* Erlang/Elixir concurrency model (and concurrent-ruby)
* Elixir pipes
* Pattern matching/destructuring
* Tail call optimization
* Type checking (touch on various attempts, look at TypeScript)
* Object#in? (not having this is a pet peeve of mine)
* Annotations (we actually already kind of have this, but could use it more)

I'll also talk about a few features that might be removed:

* Perl-style globals
* Global variables (at least the Perl-derived ones)
* Class (`@@`) variables
* Obsolete keywords (like `BEGIN`, `END`, `for`, `in`)
* Autoloading
* Block comments (`=begin`, `=end`)
* Character literals (`?a`)
* Data blocks (`DATA` and `__END__`)
* Procs (in favor of lambdas)

While I design my talks to be accessible to beginners,
this one will probably appeal more to those with more Ruby experience.


Pitch
-----

I first came up with this idea while attending the Emerging Languages Camp.
It was basically some thought experiments about what Ruby would
have looked like if Matz had made some different choices.
(Especially big things like immutability, types, and concurrency.)

The next time I thought about it was while Matz was answering
a question about what features he regretted adding to Ruby.

I've also been thinking for quite a while about programming language design.
Not in an academic sense, but what works practically for programmers.
Since I love Ruby, my language design starts there, but diverges in some significant ways.
This talk is NOT about my (currently unimplemented) language,
but more realistic changes that might be applied to Ruby.

This talk will be significantly different than John Feminella's "Steal This Talk"
at RubyConf 2017 and Bozhidar Batov's "Ruby 4.0: To Infinity and Beyond".
I'll cover less of the past and more of the (possible) future.
My choice of features will be substantially different than theirs.
For example, I won't get into the core library as much as Bozhidar.
I'll also have a standardized format for evaluating each idea.
I think we have a lot of the same goals though —
pushing Ruby forward and getting more people involved.

The main point here is to get people thinking of possibilities.
What might Ruby evolve to?
What are some possible paths forward?
How can we make Ruby better?
How can we derive more joy from programming?

Thinking about it a little more, I'd also like to advocate for a faster pace of changes,
so that Rubyists don't feel like we're stuck with trailing edge tech.


Bio
---

Craig has been using Ruby and Rails since 2005. He enjoys coding, and Ruby increases that enjoyment.
In addition to development work, he specializes in helping teams improve the way they work —
through technical practices, processes, and automation.

If you want to make small talk, ask Craig about attending concerts, traveling, canoeing, or beekeeping.


Notes
-----

* I decided a couple years ago to not take questions at the end of conference talks.
    * I'll likely make an exception for this talk, as I'm interested in feedback and more ideas.

* We've already decided that pragmas in comments are OK
    * Used (so far only) for frozen/immutable strings
    * Could be used for a host of other features
    * Allows for per-file backwards compatibility
    * Maybe we could just define our version of Ruby
        * Maybe `#! /usr/bin/env ruby -v 2.7`

* Type systems added onto Ruby
    * RDL
    * One presented at Strange Loop (2017? or 2016?)


References
----------

* Bozhidar Batsov's - Ruby 4.0: To Infinity and Beyond
    * [slides](https://speakerdeck.com/bbatsov/ruby-4-to-infinity-and-beyond?slide=254) (254 slides)
    * [EuRuKo 2017](https://www.youtube.com/watch?v=aFSuXUXRySc) (52 minutes, September 29, 2017)
    * [RubyC-2017](https://www.youtube.com/watch?v=7TAjLWX_eEs) (43 minutes, June 3, 2017)
    * [Rails Israel](https://www.youtube.com/watch?v=jKJF-F1ai1c) (29 minutes, November 14, 2016)
    * [slides](https://www.slideshare.net/AdamKabaka/ruby-40-to-infinity-and-beyond-at-ruby-conference-kenya-2017-by-bozhidar-batsov) (205 slides)
    * Immutable arrays (vectors): `@[1, 2, 3]`
    * Immutable hashes: `@{a: 1, b: 2, c: 3}`
    * Immutable sets: `@${1, 2, 3}`
    * Example of problem with class variables: https://speakerdeck.com/bbatsov/ruby-4-to-infinity-and-beyond?slide=189
* John Feminella's - The Best Features Ruby Doesn't Have (Yet)
    * [RubyConf 2017](https://www.youtube.com/watch?v=XrCU5r_NF2Q)
