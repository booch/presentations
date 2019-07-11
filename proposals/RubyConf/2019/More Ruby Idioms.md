More Ruby Idioms
================

Abstract
--------

We use idioms in our Ruby code all day long.
But what makes something an idiom?
Why do we use idioms?

In this talk, we'll explore a number of idioms.
These idioms will help us write cleaner code.
More importantly, they can help us communicate better with other developers.


Details
-------

* No clear line distinguishing between idioms and patterns
* Using `protected` keyword to indicate module template methods to override
* Using `dig`
* Using Avdi's `fetch` idiom
* Semantic braces versus `do`/`end`
* Semantic `fail` versus `raise` (Jim Weirich)
* Reasons for single versus double quotes
* Semantic spacing for braces used for blocks versus hashes
* `Array.wrap` and its predecessor
* Rails' `delegate`
* For any parameter we receive, tack on `to_a`, `to_h`, or `to_s`
    * Indicates/documents type of thing we're expecting
    * Coerces `nil` into the appropriate shape of null object for the way we'll be using it
    * Some caveats
        * Don't use with Rails' "strong params"
            * Using `params[:thing].to_h` will crash in weird ways
                * Complains about values that are not permitted
            * Use `params[:grid_filters].presence || {}` instead
* Stabby lambdas used for callbacks, etc.
* Including versus subclassing
* Method template pattern
    * Tips from Sandi
        * Initialize collaborators with `self`
* Anti-patterns
    * Having `get`/`set` in method names
    * Setting an instance variable as the intended side effect of a method
        * Eager loading; we should prefer lazy loading
    * Constants, where a function would be easier to override
        * And that overridden method should probably call `super`
        * I think being inside a concern's `include` block makes overriding a constant not work
        * Avdi has some stuff about this
    * Splitting out methods from a class to a module that (only) that class includes


Why Me?
-------

* I've done talks about idioms and patterns before
    * This one will be more focused on smaller patterns and idioms
* I've started on a book about patterns and idioms in Ruby
    * It's in some ways a clean-room rewrite of Kent Beck's Smalltalk Best Practice Patterns
        * But Ruby-specific
