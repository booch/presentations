# Nil - Nothing is Easy, Is It?

## Description (may be seen by attendees)

Nil is pretty simple — it represents nothing.
But that doesn't mean that it's always easy to use,
or that it's always the right choice when it appears to be the obvious choice.

We'll cover several anti-patterns in the use of nil.
We'll discuss *why* they're problematic, and explore some better alternatives.
The refactorings that we'll look at will help to reduce errors and optimize for understanding.
Writing good code might take a little longer in the short run,
but it pays off in the long run.

## Notes

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

A few more topics I plan to cover:

* Exceptions on nil
* Not covering the nil case in code
* Refactoring to remove nils
* Nil acting as a Boolean
* Returning Arrays instead of values or nil
* Boolean blindness (as it applies to nil)
* The Null Object pattern
    * Refer to Sandi Metz's great talk on the subject
* Avdi's "confident code" principles
* Result objects
    * Riposte gem
* Result monad
    * https://gist.github.com/keathley/0654eb9020c2deead8180d110dcc24aa

I'll spend extensive time covering the Null Object and Special Case patterns,
and how they're often a better choice than a true `nil`. I'll also speak a bit
about preventing the representation of invalid states.

I may get into type checking a bit.
Hopefully enough to show how Crystal and/or TypeScript infer
whether a value can be nil and whether the code handles that case.
I might also show the same thing for one of the Ruby type checkers.


### Alternative titles

* A Whole Lot of Nothing
* Nil - Nothing is Easy, Is It?
* Nothing is Easy, Is It?
* Nothing is Easy


## Pitch

My best-received conference talk was about Booleans.
I'd like to give a similar talk about nil.
You wouldn't think there would be enough for a 30-minute talk on either,
but I'm thorough, digging deep and wide.
Junior devs will learn a lot; everyone will likely learn something they can apply.

There's been a tradition of strong talks about `nil` at Ruby conferences.
I hope to continue in that tradition, keeping in mind the talks that have come before.
I'll review Sandi and Avdi's talks/articles/books, to make sure I'm not
missing anything important.

I write my talks so that they include introductory material at the beginning
for less experienced folks,
but dig in deep enough that advanced developers will also learn new things.

The larger point I want to drive home is that reliability and readability matter.
The refactorings that I'll show will help to reduce errors and optimize for understanding.
Writing good code might take a little longer in the short run, but it pays off in the long run.
