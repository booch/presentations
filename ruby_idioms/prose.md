
- What is an Idiom?

First I want to talk briefly about what an idiom is.

The dictionary gives us 3 definitions of "idiom".
In programming, an idiom in some ways fits all 3 definitions,
but I think the 3rd is most important.

My definition of an idiom is "the way we normally do things".

For example, idiomatic Ruby uses `each` or `map` instead of `for` or `while` loops.


- Idiom versus Pattern

Is there a difference? I don't know.

I'm in some ways going to treat them the same.

A pattern is just a template for a common solution to a common problem.

Patterns aren't just for design and architecture level issues.
For example, Kent Beck's "Smalltalk Best Practice Patterns"
talks about patterns at the method level.


- Common Ruby Idioms

When reading Ruby code, it's often clear whether we're looking at idiomatic Ruby,
or someone "writing Java in Ruby".

...


- Module Factory

The first idiom I want to talk about is the Module Factory.

... talk about what we did before this pattern

I've gone through several names for this one:
  - Parameterized Module Inclusion


... talk about how I was looking for it, then discovered it

...


- Configuration Query

Really just a case of good abstraction and API design.
We take the "normal" config query up a level of abstraction.


- Tag Module

This one comes from Avdi Grimm.

Mainly used for Exceptions.

...


- Allow Class or Instance

This one I discovered when writing the Date class for the Crystal standard library.

For `date3`, we're passing an instance.
For `date2`, we're specifying the class.

The code just news up an instance of the class if it's found to be a class.

In this case, the Julian and Gregorian claendars have different behavior,
so we need them to be separate classes.

Alternatively, we could make them constants that are instances of the class.
But then we'd have to give them singleton methods.

TODO: Show an example where we chose singleton methods?


- Circuit Breaker

This one comes to us by way of Martin Fowler
(of "Patterns of Enterprise Application Architecture" fame)
and Michael Nygard (from "Release It!").

- Fetch with Default Block

This is a simple one.

Also comes from Avdi.

Basically, the idea is to default to using a block instead of a 2nd parameter.
This is a good habit, because ...









- Ruby Meta Idioms

The overlap between Rubyists and Agile practitioners is very high.
I asked Dave Thomas about this, and he says it's because many of the same people were involved.

People forget that it's "reduce, reuse, recycle" - in that order.
I'm not sure how to recycle code, though.


- Conclusion

The main take-away here is that was can invent or discover new idioms that fit with our existing idioms.


