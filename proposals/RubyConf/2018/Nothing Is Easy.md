Nothing Is Easy, Is It?
=======================

Abstract
--------

Nil is pretty simple — it's a value that represents "nothing".
But that doesn't mean that it's always easy to use,
or that it's always the right choice when it appears to be the obvious choice.

We'll cover several anti-patterns in the use of nil.
We'll discuss *why* they're problematic, and explore some better alternatives.


Details
-------

This will be a deep dive into how `nil` is used and abused.

I'll start out with the basics — things like:
* NilClass
* nil?
* falsiness
* NoMethodError (AKA null exceptions)
* blank? and present? (only with ActiveSupport)

I'll talk about the safe navigation (lonely) operator (and `try`),
including why it's necessary. I'll get into the Law of Demeter here,
explaining why it's problematic, and when it's OK to string methods together.

I'll get into the big problem with `nil` -- it doesn't have a single meaning.
I'll cover the various meanings that people use `nil` for. I'll show
examples where we can replace it with a symbol, an empty string, or
an empty array.

I'll spend extensive time covering the Null Object and Special Case patterns,
and how they're often a better choice than a true `nil`. I'll also speak a bit
to preventing the representation of invalid states.

I'll probably take a quick look at Crystal — specifically how it uses
static type inference to prevent null exceptions. I might also explore whether
any of the Ruby static type analyzers are able to provide similar help.
I might also show the Maybe/Result monad, and the railway-oriented programming
pattern (using the dry-monads gem).


Pitch
-----

I gave a similar talk on Booleans at RailsConf.
This would be a follow-up to that talk, applying the same in-depth treatment to nil.

I design my talks for people of all experience levels.
I start with the basics, but dig in really deep, so that experienced folks
will also learn a few new things.

There's been a tradition of strong talks about `nil` at Ruby conferences.
I hope to continue in that tradition, keeping in mind the talks that have come before.
I'll review Sandi and Avdi's talks/articles/books, to make sure I'm not
missing anything important.

The larger point I want to drive home is that reliability and readability matter.
The refactorings that I'll show will help to reduce errors and optimize for understanding.
Writing good code might take a little longer in the short run, but it pays off in the long run.


Bio
---

Craig has been using Ruby and Rails since 2005. He enjoys coding, and Ruby increases that enjoyment.
In addition to development work, he specializes in helping teams improve the way they work —
through technical practices, processes, and automation.

If you want to make small talk, ask Craig about attending concerts, traveling, canoeing, or beekeeping.


References
----------
