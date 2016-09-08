A Look at Hooks
===============

* Track: Ruby Deep Dive
* Audience: Intermediate, Advanced


Abstract (public, 600 characters)
--------

Ruby has several methods that are invoked implicitly under certain circumstances.
These methods are called "hooks", and they provide points to extend behavior.
While hooks might seem like "spooky action at a distance", they can be really powerful.
In fact, hooks are one of the primary ways that Ruby provides for meta-programming.

Unfortunately, Ruby's hooks are not all documented very well.
We'll take a look at what hooks are available and how to use them.
We'll also talk about when to avoid using hooks
and provide some tips on how to troubleshoot when hooks are involved.


Details (outlines, outcomes, intended audience, etc.)
-------

I want attendees to gain confidence that these language features aren't so scary.
I want them to be aware of them, because troubleshooting code taking advantage of
hooks can get pretty hairy.

I'll start out with the basics.
Even beginning Rubyists should know when `initialize` gets called.
This shouldn't take too long; it'll be more of a gentle introduction to the idea of hooks.

I'll cover the meta-programming basics next —
`method_missing`, `respond_to?`, and `respond_to_missing?`.
I won't get into too much depth, but I'll show a few examples.
Of course, I'll make sure they understand that they need to be used in combination.

Next, I'll cover `const_missing`.
This part will likely be a caution to NOT use that so much.
For example, Rails auto-loading is probably not worth the cost.

I'll spend the bulk of the talk on `included`, `extended`, `prepended`, and `inherited`.
These are more interesting, even though they have more limited use.
I'll share some examples where I've used these recently.
I've found them useful in a few different ways.
They're often used to register subclasses to keep track of "plug-in modules" that are available.
One of the more interesting uses I've found is to convert a base class into a
module that can be included instead of inherited from.

I plan to also offer a complete list of all the hooks I've found in my research,
including all the places where Ruby calls code implicitly.
I won't have time to go into all of them in detail,
but want to make sure people know where they can find a full list and more details.
This list will include some rather obscure methods:

* set_trace_func
* Kernel.trace_var
* coerce
* Implicit and explicit conversions:
    * to_i, to_f, to_s, to_a, to_hash, to_proc, ...
* at_exit


Pitch (why this talk, why me?)
-----

I want to help people understand the "spooky action at a distance",
because it can be surprising.

I've found some good articles on Ruby hooks,
but I was surprised that there's no canonical list.
I want to help remedy this.

I've been working with Ruby since 2005, and speak regularly at my local Ruby group.
I've given talks at a few conferences, and I'm starting to get more comfortable with that as well.


Bio
---

Craig is an independent consultant specializing in helping teams improve the way they work — both their processes and their technical practices. He works as an Agile player/coach on Rails rescue projects, DevOps automation, and anything else he finds interesting.

Craig started using Ruby and Rails in late 2005, and found a home in the framework, the language, and the community.

When he's not coding, Craig enjoys canoeing, attending concerts, traveling, and beekeeping.


Resources
---------

Good resources for in-depth research:
* https://nach-vorne.eu/2007/3/18/list-of-callback-methods/
* http://panoptic.com/rking/Hook+Methods+of+Ruby
* http://blog.khd.me/ruby/ruby-callbacks/
* http://codefol.io/posts/What-Hooks-does-Ruby-have-for-Metaprogramming
* http://www.justinweiss.com/articles/rails-5-module-number-prepend-and-the-end-of-alias-method-chain/


Full List of What to Cover
--------------------------

* AKA callbacks
* Implicitly called
* "explicit is better than implicit"
* Meta-programming
* ActiveSupport::Concern
* alias_method_chain

* initialize
* included
* extended
* prepended
* inherited
* method_missing
* respond_to? and respond_to_missing?
* const_missing
* extend_object
* method_added
* singleton_method_added
* method_removed and method_undefined
* singleton_method_removed and singleton_method_undefined
* initialize_clone, initialize_dup and initialize_copy
* Kernel#set_trace_func (basically a global method_called)
* Kernel.trace_var, untrace_var
* Module#append_features, prepend_features
* coerce
* induced_from (deprecated as of 1.9)
* Implicit and explicit conversions:
    * to_i, to_f, to_s, to_a, to_hash, to_proc, ...
* marshal_load, marshal_dump
* at_exit
* BEGIN, END
* ObjectSpace.each_object
* ObjectSpace#define_finalizer
* Module#name funniness:
    m = Module.new
    puts m.name # => nil
    M = m
    puts m.name # => "M"
* Module#autoload (sort of)


Notes
-----

* Include a picture of Captain Hook
* Talk about the difference from callbacks
* Talk about how Rails has some "implicit"
* Puns:
    * Grappling
    * Captain Hook
