# Nil - Nothing is Easy, Is It?

## Description (seen by attendees)

Nil is pretty simple — it represents nothing. But that doesn't mean that it's always easy to use, or that it's always the right choice when it appears to be the obvious choice.

We'll cover several concerns with the use of nil. We'll discuss *why* they're problematic, and explore better alternatives. We'll rediscover some OOP principles along the way, and refactor to increase code quality and maintainability.

## Notes

This will be a deep dive into how `nil` is used and abused. I've given a similar talk about Booleans, which was well-received.

I'll start out with the basics — things like:

* NilClass
* nil?
* falsiness
* NoMethodError (AKA null exceptions)
* blank? and present? (only with ActiveSupport)

Then I'll dig deeper and get into the big problem with `nil` -- it doesn't have a single meaning. I'll cover the various meanings that people use `nil`, with examples where we can replace it with a better construct.

* safe navigation (lonely) operator
* `try`
    * How it differs from the lonely operator
* Exceptions on nil
* Nil acting as a Boolean
* Returning Arrays instead of values or nil
* The Null Object pattern
* Special Case pattern
* Preventing representation of invalid states

There's been a tradition of strong talks about `nil` at Ruby conferences. I hope to continue in that tradition, keeping in mind the talks that have come before. I'll review Sandi and Avdi's talks/articles/books, to make sure I'm not missing anything important. I'll reference them in my talk.

I write my talks so that they include introductory material at the beginning for less experienced folks, but dig in deep and wide enough that advanced developers will also learn new things.

The larger point I want to get across is that OOP principles are still important and that we should learn to use our tools well.

### Alternative titles (or subtitles)

* Nil - Nothing is Easy, Is It?
* Nothing is Easy, Is It?
* A Whole Lot of Nothing
* Nothing is Easy
* Nil - Nothing is Easy
* A Talk About Nothing
