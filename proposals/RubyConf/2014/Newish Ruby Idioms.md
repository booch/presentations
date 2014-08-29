Ruby Idioms You're Not Using Yet
================================

Abstract
--------

Idioms are some of the smallest patterns that we use in our programming languages. Learning the idioms of a language helps you more quickly understand commonly used patterns. Over time, some idioms fall out of favor, and new idioms are developed and adopted.

In this talk, we'll explore a few idioms that are relatively new to the Ruby community.

Here's an example:

~~~ ruby
# Common Ruby:
include X::Y
xy_config a: 1

# Newer idiom:
include X.y(a:1)
~~~


Details
-------

Idioms to cover:

* Parameterized module inclusion, AKA module factories (example above)
* Using keyword parameters
* Newer uses of Null pattern
* Avdi's recommended `hash.fetch(key) { value_if_missing }`
* Allow class or instance
* Circuit Breaker
* Tag Modules
* Simple Struct classes (including story how we used it to move behavior out of DB):

~~~ ruby
module Fields
  class Type < Struct(:id, :name, :parser)
  end
    
  Boolean = Type.new(1, 'boolean', Fields::Parsers::Boolean)
  Date    = Type.new(2, 'date', Fields::Parsers::Date)
end
~~~

If accepted, I'll also continue my search for more new idioms, including asking several Ruby luminaries.



Pitch
-----

I discovered the parameterized module inclusion pattern about a year ago being used in Virtus,
after looking for such a solution for several years.
I wrote up a blog post on it earlier this year.
I've also spoken about some of these at the local Ruby user group.

I'd like to promote the use of these new idioms -- I'm especially excited by the parameterized module inclusion idiom.
But I'd also like to get people thinking about idioms in general, and the idea that we can come up with new ones.
