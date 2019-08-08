Idioms and Beyond
=================

Abstract
--------

We use idioms in our Ruby code all day long.
But what makes something an idiom?
Why do we use idioms?

In this talk, we'll explore a number of idioms.
Some might be familiar, but some will be new to you.
These idioms will help us write cleaner code.
More importantly, they can help us communicate better with other developers.


Details
-------

This talk will include both examples of specific idioms, and a discussion of idioms in general.
I'll work to drive home how idioms help us to better communicate and understand code.

I'll actually veer into style a bit, to show that there is actually a relationship between the two.
Code styles can be used to communicate extra information, and in such cases become idiomatic.

Some specifics I intend to cover:

* Standard library methods you're probably not using yet (or fully)
    * Using `dig` for nested hash/array access
    * Avdi's `fetch` idiom
    * `Array.wrap` and its predecessor
* Rails' `delegate` versus Ruby's `Forwardable`
* Factories
    * Where and how to use them
    * Using them to create specialized modules to mix in
* For any parameter we receive, tack on `to_a`, `to_h`, or `to_s`
    * Indicates/documents type of thing we're expecting
    * Coerces `nil` into the appropriate shape of null object for the way we'll be using it
    * Some caveats
        * Don't use with Rails' "strong params"
            * Using `params[:thing].to_h` will crash in weird ways
                * Complains about values that are not permitted
            * Use `params[:grid_filters].presence || {}` instead
* Method template pattern
    * Tips from Sandi
        * Initialize collaborators with `self`
* Including versus subclassing
* Semantic meaning behind style choices (hat tip to Jim Weirich)
    * Curly braces when the return value of the block is used; otherwise `do`/`end`
    * Use `fail` to throw an exception, unless it's re-raising — then use `raise`
    * Extra spacing for braces used for blocks versus hashes
    * Using `protected` keyword to indicate module template methods to override
* Stabby lambdas used for callbacks, etc.
* Reasons for single versus double quotes
    * I'll present the arguments for both sides, letting people choose for themselves
    * Semantic meaning (interpolation)
    * Reducing unnecessary code churn
    * Reducing need for escaping
* Anti-patterns
    * Having `get`/`set` in method names
    * Setting an instance variable as the intended side effect of a method
        * Eager loading; we should prefer lazy loading
    * Constants, where a function would be easier to override
        * And that overridden method should probably call `super`
        * Note that being inside a concern's `include` block makes overriding a constant not work
        * Avdi has some stuff about this
    * Splitting out methods from a class to a module that (only) that class includes


Why Me?
-------

I've done a few talks about idioms and patterns before.
This one will be more focused on smaller patterns and idioms.

I've started on a book about patterns and idioms in Ruby.
It's in some ways a clean-room rewrite of Kent Beck's _Smalltalk Best Practice Patterns_,
but Ruby-specific.

So I'm always on the lookout for new patterns and idioms,
and might add more to the talk as I find them.


Notes
-----

* No clear line distinguishing between idioms and patterns
* Good article on delegation in Ruby:
    * http://radar.oreilly.com/2014/02/delegation-patterns-in-ruby.html
