Persisting Instance-Specific Behavior
=====================================


Abstract
--------

Rails models are great for storing data.
But what if we need to store some sort of behavior that is specific to each piece of data?

I've run into this question a couple times, and there doesn't seem to be a clear answer.

In this presentation, we'll explore what options are available, and the pros and cons of each potential solution.
Along our journey, we'll run into a few interesting Ruby techniques.


Details
-------

I've found a few options:

* Store a string, run eval on it
* Hard-code the behaviors
* Define a method for each possible behavior
* Define a class for each possible behavior
* Custom DSL
* Generic DSL

I'll start with the `eval` solution, and explain why it's almost always a bad idea.

Then I'll show an example of hard-coding, from my most recent encounter with the problem.
This example uses several somewhat advanced/interesting techniques:

* A model class that's not backed by a DB, but by an array of constants
* Initializing model instances with a block
* A custom finder that takes a model instance, runs the block with it, returning a set of other models

Here's the code for that model, so you can get a better idea what I'm talking about:

~~~ ruby
class Shelter
  cattr_accessor :shelters
  attr_reader :name, :filter

  def initialize(name, &filter)
    @name = name
    @filter = filter
    self.class.shelters ||= []
    self.class.shelters << self
  end

  def self.find_for_user(user)
    shelters.map {|s| {name: s.name, services: s.filter.call(user)}}.select {|h| h[:services]}
  end
end

Shelter.new('A Shelter') do |user|
  [:meal, :housing] if user.ssn.present?
end
Shelter.new('Center for Women') do |user|
  [:housing] if user.older_than?(16) || !user.male?
end
~~~

But hard-coding isn't a tenable long-term solution, if you expect more than a few behaviors.

A slight step up from hard-coding is defining a method or class for each possible behavior.
I'll modify the above example to show those options.
The class-based implementation will also use single-table inheritance.
These still require hard-coding the behaviors in the code though.

The most flexible option is a DSL.
This would be an external DSL, not the internal DSLs that we're used to.
(I'll explain the difference.)
There are 2 ways to save the behavior to the database.
The more complex way is to have models representing fields, operators, and values.
The simpler way is to store the behavior as a string;
that gives more flexibility, but requires parsing the string.

I'll show an older example using fields, operators, and values.

One thing I've noticed is that the DSL always seems to represent criteria.
So I think a generic approach could be widely useful.
I'm hoping to start on a more generic DSL as well,
that allows you to just store a string in the database describing the criteria
(I've looked for an existing library for this, but my research hasn't found any.)


Pitch
-----

I've come across this problem only a couple times,
and I think it's really interesting.
Not only that, but the various solutions touch on several other interesting topics:

* Non-DB-backed models
* Initializers that take a block
* Single-table Inheritance (STI)
* External DSLs
* Parsing, grammars, etc.

I've been working with Ruby since 2005, and speak regularly at my local Ruby group.
I've had the opportunity to speak at a few conferences the past couple years,
and have really enjoyed the experience.


Bio
---

Craig is an independent consultant specializing in helping teams improve the way they work — both their processes and their technical practices. He works as an Agile player/coach on Rails rescue projects, DevOps automation, and anything else he finds interesting.

Craig started using Ruby and Rails in late 2005, and found a home in the framework, the language, and the community.

When he's not coding, Craig enjoys canoeing, attending concerts, traveling, and beekeeping.
