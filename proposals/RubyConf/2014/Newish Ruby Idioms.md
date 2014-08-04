New(ish) Ruby Idioms
====================

Abstract
--------

In human languages, idioms are phrases that have a diffrernt meaning than their literal meaning;
they're closley tied to the culture of the speakers.
Idioms in programming langugaes are similar -- they're more part of the culture than the syntax.

Idioms are some of the smallest patterns that we use in our programming languages.
Learning the idioms of a language helps you more quickly understand commonly used patterns.
Over time, more idioms are developed.

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



Pitch
-----

I discovered the parameterized module inclusion pattern about a year ago being used in Virtus,
after looking for such a solution for several years. I wrote up a blog post on it earlier this year.

