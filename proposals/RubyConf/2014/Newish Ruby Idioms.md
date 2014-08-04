New(ish) Ruby Idioms
====================

Abstract
--------

In human languages, idioms are phrases that have a different meaning than their literal meaning;
they're closely tied to the culture of the speakers.
Idioms in programming langugaes are similar -- they're more part of the culture than the syntax.

Idioms are some of the smallest patterns that we use in our programming languages.
Learning the idioms of a language helps you more quickly understand commonly used patterns.
Over time, some idioms fall out of favor, and new idioms are developed and adopted.

In this talk, we'll explore a few idioms that are relativley new to the Ruby community.

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

* Parameterized module inclusion (example above)
* Null pattern, perhaps?
* Some ideas from POODR?
* Some ways to use keyword params?
* Ask some Ruby luminaries for more ideas?
* This, maybe (tell story how we used it to move stuff out of DB):

~~~ ruby
module Fields
  module Types
    class Type < Struct(:id, :name, :parser)
    end
    
    Boolean = Type.new(1, 'boolean', Fields::Parsers::Boolean)
    Date    = Type.new(2, 'date', Fields::Parsers::Date)
  end
end
~~~


Pitch
-----

I discovered the parameterized module inclusion pattern about a year ago being used in Virtus,
after looking for such a solution for several years.
I wrote up a blog post on it earlier this year.
I've also spoken about some of these at the local Ruby user group.

I'd like to promote the use of these new idioms -- I'm especially excited by the parameterized module inclusion idiom.
But I'd also like to get people thinking about idioms in general, and the idea that we can come up with new ones.
