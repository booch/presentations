layout: true

<footer>
  <p class="left">@CraigBuchek</p>
  <p class="right">http://craigbuchek.com/ruby-experiments</p>
</footer>

---
class: title, middle, center
# Ruby Experiments
## Or
## Refinements Are Useful!

![Craig Buchek's avatar](images/CraigBuchek-avatar.png)

???

* Welcome!
* Today I'm going to talk about:
    * Some things I've been experimenting with
        * In the Ruby programming language
* Lower right: Link to slides
    * Press `P` to see my presenter notes
        * Links
        * Extra notes I won't talk about
* My Twitter handle is in the lower left corner
    * Feel free to tweet **at** me or **about** me
* If this is a local group:
    * Feel free to jump in at any time
        * To ask questions
        * To add your thoughts

---

# Changes to Ruby

* I've been wanting to contribute to Ruby
    * The language itself
    * The standard library

---
class: title, middle, center

# Digging

---

# dig

~~~ ruby
x = [1, {a: {b: 2}}]
x.dig(1, :a, :b)  # => 2
x.dig(1, :a, :c)  # => nil
~~~

???

* Added in Ruby 2.3
* On `Hash` and `Array`

---

# Fetching

~~~ ruby
h = {a: 1, b: 2, c: 3}
h[:a]                   # => 1
h[:d]                   # => nil
h.fetch(:a)             # => 1
h.fetch(:d)             # => KeyError: key not found: :d
h.fetch(:d, 123)        # => 123
h.fetch(:d) { 123 }     # => 123
h.fetch(:d) { |i| fail "must supply #{i}" }
h.fetch(:d) { |i| "cannot find #{i}" }
~~~

???

* Those last 3 are the "Avdi fetch pattern"
    * http://www.virtuouscode.com/2009/03/16/go-fetch/
* Exists for both Array and Hash

---

# Extension to dig

~~~ ruby
x = [1, {a: {b: 2}}]
x.dig(1, :a, :c) { 3 }  # => 3
x.dig(1, :a, :c) { |i| "Can't find '#{i}'" }  # => "Can't find 'c'"
~~~

???

* I think `dig` is analogous to `fetch`
    * So it should take a block, like `fetch` does
* I'd also like `dig` to work with more than just Arrays and Hashes
* Note that the default value has to be passed in as a block
    * Whereas `fetch` allows it as a regular argument or a block
* Note that `i` could be an index or a key

---

# Digging into Other Things

~~~ ruby
RUBY_VERSION          # "2.5.7"
x = [1, {a: {b: 2}}]
x.dig(1, :a, :b, :c)  # => TypeError: Integer does not have #dig method
~~~

~~~ ruby
RUBY_VERSION          # "2.6.5"
x = [1, {a: {b: 2}}]
x.dig(1, :a, :b, :c)  # => nil
~~~

---

# Digging and Updating

~~~ ruby
x = [123, {a: {b: 2}}]
x.dig!(1, :a){ |a| a.delete(:b) }  # => [123, {a: {}}]
x.dig!(1, :a){ |a| a[:b] = 4 }     # => [123, {a: {b: 4}}]
~~~

???

* `dig!` is roughly equivalent to Elixir's `Kernel.update_in`
* For something similar, but more extensive, take a look at scopes in `xf`
* Kind of like a lens, but not really
    * We don't really need lenses in Ruby, due to OOP

---
class: title, middle, center

# Floating

---

# Floating Point Issues

~~~ ruby
x = 0.1 + 0.2
puts "This prints, but it should not!" if x != 0.3
~~~

???

* The base-10 numbers we use cannot be converted into exact base-2 floats
    * So the internal representations of `0.1` and `0.2` are not exact
    * Nor is the sum of those 2 numbers
    * And the sum of those 2 numbers will not be exactly `0.3`
        * And in fact has a slightly different value than the directly-entered `0.3`

---

# Comparing Floats Properly

~~~ ruby
EPSILON = 0.0001
x = 0.1 + 0.2
puts "This should not print." if (0.3 - x).abs > EPSILON
~~~

---

# Comparing Floats Properly

~~~ ruby
EPSILON = 0.0001
RSpec.describe "using epsilon to test floating point math" do
  expect(0.1 + 0.2).to be_within(EPSILON).of(0.3)
end
~~~

---

# Safer Floats

~~~ ruby
require 'safer_floats'
0.1 + 0.2 == 0.3  # => SaferFloats::Error
0.2 + 0.2 != 0.3  # => SaferFloats::Error
~~~

???

* It's much preferable to get an error than to get the wrong answer
    * I have a very strong opinion on this

---
class: title, middle, center

# Methods

---

# The methods Method

~~~ ruby
random_object.methods
# => [:can?, :cannot?, :paper_trail_originator, :paper_trail_enabled_for_model?, :whodunnit]
~~~

???

* Often, I'll also want to see what methods the object can respond to.
* I'll use a method that's on `Object`, named `methods`.
* Notice that these usually return a long list of methods.
    * They're running off the right side of the text box here.
* Show of hands - who's familiar with either of these methods?
* How many of you (with your hands up) know that they take an optional parameter?
* How many of you remember whether to pass `true` or `false` to not show methods from superclasses?

---

# The methods Method

~~~ ruby
random_object.methods(false)
# => [:id, :first_name, :last_name]

random_object.class.instance_methods(false)
# => [:id, :first_name, :last_name]
~~~

???

* It happens to be `false` for these methods.
* But to use it properly, you have to remember that.
* Can we do better?

---

# Named Parameter

~~~ ruby
random_object.methods(superclass_methods: false)
# => [:id, :first_name, :last_name]
~~~

???

* Change `#methods` to take a `superclass_methods` named parameter
    * Where it now takes an optional unnamed Boolean
    * Allow for backwards compatibility
    * Also allow a mode where it subtracts out all methods from Object.new
* Make the same changes to `Class#instance_methods`
    * See http://booch.github.io/presentations/Booleans_Are_Easy/slides.html#p21

---
class: title, middle, center

# Sorting

---

# Sorting an Array with Nils

~~~ ruby
[1, 2, 3, 6, 1, 7, nil, 8, nil, -2].sort
# => ArgumentError: comparison of NilClass with 1 failed
~~~

---

# Sortable Nil

~~~ ruby
require 'sortable_nil'
[1, 2, 3, 6, 1, 7, nil, 8, nil, -2].sort(nil: :first)
# => [nil, nil, -2, 1, 1, 2, 3, 6, 7, 8]
[1, 2, 3, 6, 1, 7, nil, 8, nil, -2].sort(nil: :last)
# => [-2, 1, 1, 2, 3, 6, 7, 8, nil, nil]
[1, 2, 3, 6, 1, 7, nil, 8, nil, -2].sort(nil: :drop)
# => [-2, 1, 1, 2, 3, 6, 7, 8]
[1, 2, 3, 6, 1, 7, nil, 8, nil, -2].sort
# => [-2, 1, 1, 2, 3, 6, 7, 8]
~~~

---
class: title, middle, center

# Enumeration

---

# to_enum

~~~ ruby
o = 1.to_enum
# => #<Enumerator: 1:each>
n = nil.to_enum
# => #<Enumerator: nil:each>
o.map { |x| x + 1 }
# => NoMethodError: undefined method `each' for 1:Integer
n.map { |x| x + 1 }
# => NoMethodError: undefined method `each' for nil:NilClass
~~~

???

* `to_enum` has been around since at least Ruby 1.8
    * It's defined on `Object`
        * But only seems to work on `Enumerable` objects
* An Enumerator is an Enumerable
    * But it also has `next`, `peek`, `rewind`
        * Raises `StopIteration` if there's no next item
    * It's an _external_ enumerator
        * Like what you usually use in Java
* I can't quite come up with a good reason to use one
    * Like Article telling you to use it sometimes instead of `include Enumerable`:
        * https://blog.arkency.com/2014/01/ruby-to-enum-for-enumerator/

---

# Enumerable Nil

~~~ ruby
require 'enumerable_nil'
n = nil.to_enum       # => #<Enumerator: nil:each>
n.map { |x| x + 1 }   # => []
nil.map { |x| x + 1}  # => []
~~~

???

* Note that `Enumerable#map` always returns an array
* We don't actually have to use the `to_enum` at all
* I think this one is actually really useful
    * Treats `nil` exactly like any other empty Enumerable
    * Solves a large percentage of crashes trying to call methods on `nil`
    * I don't believe it has any negative side effects
* Maybe we should *require* the `to_enum` to get this?

---

# Enumerable Object

~~~ ruby
require 'enumerable_object'
o = 1.to_enum        # => #<Enumerator: 1:each>
o.map { |x| x + 1 }  # => [2]
1.map { |x| x + 1 }  # => [2]
~~~

???

* I think this one is almost as useful as Enumerable Nil
    * Treats scalar object exactly like any other Enumerable with 1 item
    * I don't believe it has any negative side effects
    * Probably won't catch nearly as many crashes as Enumerable Nil
* Maybe we should *require* the `to_enum` to get this?

---
class: title, middle, center

# FAIL!

---

# Nil

~~~ ruby
nil.nil?       # => true
nil.class      # => NilClass < Object
nil.object_id  # => 8
nil.to_a       # => []
nil.to_h       # => {}
nil.foo        # => NoMethodError: undefined method `foo' for nil:NilClass
~~~

???

* Pro tip: If you think you have an Array, or something array-like, use `to_a`
    * It will crash right there if your assumption is wrong
    * If it's an Array, it's a no-op
    * If it's something like an Array, or nil, it will do the right thing
    * Same for a Hash and `to_h`

---

# RSpec's Null Object

~~~ ruby
RSpec.describe "as_null_object" do
  it "returns itself" do
    dbl = double("Some Collaborator").as_null_object
    expect(dbl.foo.bar.bazz).to be(dbl)
  end
end

~~~

???

* RSpec's null object lets you call any method on it
    * And returns itself, so you can chain methods
* That's straight from RSpec's documentation
    * https://relishapp.com/rspec/rspec-mocks/v/3-8/docs/basics/null-object-doubles

---

# Propagating Nil

~~~ ruby
class NilClass
  EXCEPTED_METHODS = %w[to_str expand_path]
  def method_missing(method_name, *_args, &_block)
    if EXCEPTED_METHODS.include?(method_name)
      super
    else
      nil
    end
  end

  def respond_to_missing?(_method_name, _include_private = false)
    true
  end
end
~~~

???

* So I thought: that was pretty cool, let's try it with `nil`
* It'll be easy!
    * Just define `method_missing`
    * And `respond_to_missing?`
        * Because you should always define `respond_to_missing?` when you define `method_missing`
* Note that I have a way to exclude some methods, allowing them to raise an exception as usual

---

# Propagating Nil - Tests

~~~ ruby
RSpec.describe PropagatingNil do
  it "allows `nil` to respond to anything" do
    expect{
      nil.sdfgdsfg
    }.not_to raise_exception(NoMethodError)
  end
  it "still allows calling methods defined in NilClass" do
    expect(nil.nil?).to be(true)
  end
end
~~~

???

* Like a good Ruby developer, I wrote tests for my `propagating_nil` gem

---

# Propagating Nil - Whoops!

~~~
$ rake spec
Finished in 0.00052 seconds (files took 0.10075 seconds to load)
0 examples, 0 failures

Traceback (most recent call last):
	15: from rspec-core-3.8.2/exe/rspec:4:in `<main>'
	14: from rspec-core-3.8.2/lib/rspec/core/runner.rb:45:in `invoke'
	13: from rspec-core-3.8.2/lib/rspec/core/runner.rb:71:in `run'
...
	 3: from rspec-core-3.8.2/lib/rspec/core/metadata.rb:228:in `create'
	 2: from rspec-core-3.8.2/lib/rspec/core/metadata.rb:137:in `populate'
	 1: from rspec-core-3.8.2/lib/rspec/core/metadata.rb:155:in `populate_location_attributes'
rspec-core-3.8.2/lib/rspec/core/metadata.rb:155:in `expand_path':
can't convert NilClass to String (NilClass#to_str gives NilClass) (TypeError)
~~~

???

* But I couldn't get the tests to run
* The traceback shows **only** files from RSpec itself
    * So I broke something in RSpec with my changes to NilClass
    * Note that the error says `NilClass#to_str gives NilClass`
        * But it shouldn't, due to my list of exceptions
* Looks like it's not gonna be so easy :(

---

# Refinements

~~~ ruby
module PropagatingNil
  EXCEPTED_METHODS = %w[to_str expand_path]

  refine NilClass do
    def method_missing(method_name, *_args, &_block)
      if EXCEPTED_METHODS.include?(method_name)
        super
      else
        nil
      end
    end

    def respond_to_missing?(_method_name, _include_private = false)
      true
    end
  end
end
~~~


???

* Is there some way to isolate my changes?
    * So my changes don't mess with RSpec
* I was looking at the code for Pretty Ruby and reading the associated article
    * I'll be talking about that in a bit
* I saw that they used refinements
    * I looked into why that was
    * Turns out it's to isolate the changes
* This code is the same as before, except:
    * It's in a module
    * It's got `refine NilClass do` instead of `class NilClass`

---

# Refinements - Using

~~~ ruby
RSpec.describe PropagatingNil do

  using PropagatingNil

  it "allows `nil` to respond to anything" do
    expect{
      nil.sdfgdsfg
    }.not_to raise_exception(NoMethodError)
  end

  it "still allows calling methods defined in NilClass" do
    expect(nil.nil?).to be(true)
  end

end
~~~

???

* The test is also the same as before, except:
    * I added `using PropagatingNil`
        * This pulls in the refinements
        * It's "lexically scoped"
            * It only applies to the current scope
                * After that last `end`, the changes apply to no other code

---

# Refinements - Huh?

~~~
$ rake spec
Failures:
  1) PropagatingNil allows `nil` to respond to anything
     Failure/Error:
       expect{
         nil.sdfgdsfg
       }.not_to raise_exception(NoMethodError)
       expected no NoMethodError, got #<NoMethodError: undefined method `sdfgdsfg' for nil:NilClass> with backtrace:
         # ./spec/propagating_nil_spec.rb:7:in `block (3 levels) in <top (required)>'
         # ./spec/propagating_nil_spec.rb:6:in `block (2 levels) in <top (required)>'
~~~

???

* My refinements didn't seem to work
* After some searching, I found that `method_missing` doesn't work as a refinement
    * https://bugs.ruby-lang.org/issues/13129
    * Matz said in 2017 that he's likely to keep the restriction
        * Because refinements are static rebinding and `method_missing` is dynamic rebinding
* So my PropagatingNil gem was a complete failure
    * Except that I learned when/how to use refinements

* Now I'm using them for all my RubyExperiments gems
    * So users can opt in, and the changes aren't global
    * Except that the changes I'm proposing **would be** global
        * So maybe I really **shouldn't** hide them away in refinements

---
class: title, middle, center

# Pretty Ruby

???

* I read an article by Jonah Goldstein, called "Making Ruby Yours"
    * It was over a year ago
    * I keep coming back to it
    * https://dzone.com/articles/making-ruby-yours
    * Has an associated gem, named `pretty_ruby`

---

# Pretty Ruby - Block and Procs

~~~ ruby
arr = [ [1, 2, 3], ['a', 'b', 'c'] ]
arr.map(&:join)             # => ['123', 'abc']
arr.map{ |x| x.join('-') }  # => ['1-2-3', 'a-b-c']
~~~

???

* He got frustrated by the fact that the syntax changed so drastically between the 2 uses
* He spent some time learning about what the `&` does
    * It converts the object to a Proc, by calling `to_proc` on it
    * `Symbol#to_proc` creates a proc that `send`s the symbol to the receiver
        * I.e. it calls the method with the given name

---

# Pretty Ruby - Extension

~~~ ruby
using PrettyRuby
arr = [ [1, 2, 3], ['a', 'b', 'c'] ]
arr.map(:join)       # => ['123', 'abc']
arr.map(:join, '-')  # => ['1-2-3', 'a-b-c']
~~~

???

* So he made an extension (an experiment) to allow a simpler syntax
* There are 2 changes here:
    * If we pass a symbol, use it as a method name
    * If we pass a symbol and more arguments, pass those arguments to the named method

---

# Pretty Ruby - Chaining

~~~ ruby
arr = 'hello'.chars
using PrettyRuby
arr.map(:next >> :upcase).join('-')  #=> "I-F-M-M-P"
~~~

???

* He repurposed the `>>` operator on `Symbol` to create a Proc that composes 2 methods
    * And on `Proc` and `Array`, to chain a Proc with a symbol
* Ruby is getting something similar in 2.7
    * But not as useful as this
    * It's mainly just a different syntax for method chaining
        * With a different precedence

* Pretty Ruby has several other changes and additions
    * Allows negative indexes for some methods that don't allow it
        * Like `Array#take` and `Array#drop`
    * Adds some more Array methods
        * Like `tail` and `init`

---
class: title, middle, center

# Lemurs

???

* Brandon Weaver has given several talks in the past few years
    * You'll remember them for the cartoon lemurs he draws
* He also has several experiments with Ruby

---

# Mf - Modifier Functions

~~~ ruby
numbers = [1, 2, 3, 4, 5]
people = [{name: 'Craig', age: 48}, {name: 'Beth', age: 44}]
numbers.map(&Mf + 5)      # => [6, 7, 8, 9, 10]
numbers.map(&Mf * 5)      # => [5, 10, 15, 20, 25]
numbers.select(&Mf >= 3)  # => [3, 4, 5]
people.map(&Mf[:age])     # => [48, 44]
~~~

???

* The `&Mf` is called an _anaphor_
    * The use of it is called _anaphora_
    * It refers back to some _antecedent_
* In Groovy, we could just use the keyword `it`
* Several other attempts at adding this to Ruby:
    * https://github.com/rapportive-oss/ampex
* Lots of articles from Reg Braithwaite:
    * https://github.com/raganwald-deprecated/homoiconic/blob/master/2012/05/anaphora.md
    * https://github.com/raganwald-deprecated/homoiconic/blob/master/2008-11-28/you_cant_be_serious.md

---

# Ruby 2.7

~~~ ruby
RUBY_VERSION                # "2.7"
numbers = [1, 2, 3, 4, 5]
numbers.map { @1 + 5 }      # => [6, 7, 8, 9, 10]
numbers.map { @1 * 5 }      # => [5, 10, 15, 20, 25]
numbers.select { @1 >= 3 }  # => [3, 4, 5]
~~~

???

* In Ruby 2.7, we can use numbered arguments
    * It gives us the same thing
    * Can only be used inside blocks

---

# Xf - Transform Functions

~~~ ruby
%w(1 2 3 4).map(&Xf.pipe(:to_i, :succ))
# => [2, 3, 4, 5]
%w(1 2 3 4).map(&Xf.compose(:succ, :to_i))
# => [2, 3, 4, 5]
~~~

???

* His `pipe` and `compose` are similar to Pretty Ruby's function composition
* Pipes execute the functions from left to right
* Composition executes the functions listed from right to left
    * This is from mathematical notation of function composition

---

# Xf - Transform Functions

~~~ ruby
people = [{name: "Bob", age: 21}, {name: "Jo", age: 32}, {name: "Ed", age: 43}]
age_scope = Xf.scope(:age)
people.map(&age_scope.set { |age| age + 1 })
# => [22, 33, 44]
people.map(&age_scope.get)
# => [21, 32, 43]
people.map(&age_scope.set! { |age| age + 1 })
# => [22, 33, 44]
people.map(&age_scope.get)
# => [22, 33, 44]
~~~

???

* His `scope` is like a lens in a functional language like Haskell
* Probably not all that useful in Ruby
    * OOP makes lenses less useful,

---
class: title, middle, center

# Ruby Syntax

---

# Automatically Set Instance Variables

~~~ ruby
class Point
  attr_reader :x, :y
  def initialize(@x, @y); end
end
p = Point.new(1, 2)
p.x  # => 1
p.y  # => 2
~~~

???

* This one requires changes to syntax
* Like CoffeeScript and Crystal have
* I cannot see any issues with adding this feature
* Great for simplifying initializers

---

# Rewrite Rails

~~~ ruby
(1..100).select(&:odd?).inject(&:+).into { |x| x * x }
# => 6250000
returning [1, 2, 3] do |a|
  pp(a)
end
# => [1, 2, 3]
~~~

???

* Reg Braithwaite wrote this in 2012
    * It reads `.rr` files, converts to (and runs) `.rb` files
        * Parses the `.rr` file as Ruby, with a few extensions
* His `into` is basically `map` for a single object
    * Apparently this is called the "Thrush Combinator"
* Implemented several things before they were added to Ruby
    * His `returning` became Ruby's `tap`
        * AKA the "Kestral" or K combinator
    * His "Extension Methods" became Ruby's refinements
        * Apparently they came from C# 3.0
* His previous attempt (Rewrite) rewrote blocks instead of files

* https://github.com/raganwald-deprecated/rewrite_rails/blob/master/doc/block_anaphora.md#readme
* https://github.com/raganwald-deprecated/rewrite_rails/blob/master/doc/into.md#readme
* https://github.com/raganwald-deprecated/rewrite_rails/blob/master/doc/call_by_name.md#readme
* https://github.com/raganwald-deprecated/rewrite_rails/blob/master/doc/extension_methods.md#readme
* https://github.com/raganwald-deprecated/rewrite_rails/blob/master/doc/returning.md#readme

---

# Hijacking Ruby Syntax in Ruby

~~~ ruby
module E1
  extend Finalist

  final def foo
  end
end

module E2
  include E1
end

module E3
  include E2

  def foo # => raise
  end
end
~~~

???

* Satoshi Tagomori & Tomohiro Hashidate
* https://confreaks.tv/videos/rubyconf2018-hijacking-ruby-syntax-in-ruby
* Implemented `abstract`, `final`, and `override` from Java
* Uses several methods
    * Ruby's TracePoint functionality
    * Method hooks (run when a method is defined)

* https://github.com/joker1007/abstriker
* https://github.com/joker1007/finalist
* https://github.com/joker1007/overrider

---

# Compiling "Ruby"

~~~ ruby
24 * 60 * 60
# => 86400
~n(24 * 60 * 60)
# => 86400
~d(October 14, 2019)
# => #<Date: 2019-10-14 ((2458771j,0s,0n),+0s,2299161j)>
~~~

???

* Kevin Deisz (@kddeisz)
    * Pronounced "dice"
    * RubyConf 2017 talk
        * https://www.youtube.com/watch?v=iWDOXi7Kj2o
* Reads Ruby(ish) code
    * Compiles it to RubyVM instructions
* He implemented `~n` to tell the compiler to run that at compile time
* He implemented `~d` to parse a date at compile time
* Uses `load_iseq` (InstructionSequence)
* https://github.com/kddeisz/vernacular

---

# Compiling "Ruby"

~~~ ruby
content = File.read(source_path)
content.gsub!(/~n\(([\d\s+-\/*\(\)]+?)\)/) do |match|
  eval(match[3..-2])
end
content.gsub!(/~d\(([\d\s+-\/*\(\)]+?)\)/) do |match|
  date = Date.parse(eval(match[3..-2]))
  "Date.strptime('#{date.strftime}')"
end

iseq = RubyVM::InstructionSequence.compile(content)
File.binwrite(iseq_path, iseq.to_binary)
iseq
~~~

???

* Here's some of the implementation of Vernacular
* He also shows how he added syntax to add type checking

---
class: single-image, thanks

![Thanks!](images/Thank You - word cloud.jpg)

---
class: single-image, this-agile-life

![This Agile Life podcast logo](images/This Agile Life.jpg)

???

* You can hear more of me on This Agile Life

---

# Contact

* GitHub: booch
* Repo: github.com/boochtek/ruby_experiments
* Twitter: @CraigBuchek
* Email: craig@boochtek.com

???

* The source for this presentation is on GitHub
    * In my `presentations` repo
* Any further questions?
* Anyone want to go further in-depth on anything?

-----

* Source for this talk:
    * https://github.com/booch/presentations/tree/master/Ruby_Experiments
* Tools used:
    * [Remark][Remark] slide show (Markdown to HTML)
        * Customized CSS
        * Customized presenter notes layout


[Remark]: http://remarkjs.com/
