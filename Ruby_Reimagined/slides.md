layout: true

<header>
  <p class="left">STL Ruby - October 2018</p>
  <p class="right">@CraigBuchek</p>
</header>

<footer>
  <p class="left"><!-- page numbers --></p>
  <p class="right">http://craigbuchek.com/ruby-reimagined</p>
</footer>

---
class: title, middle, center

# Ruby Reimagined

### Craig Buchek

---
class: middle

* Slides: http://craigbuchek.com/ruby-reimagined


* Hit `P` to toggle presenter notes
    * References
    * More details than I will talk about

???

* If you want to follow along, or see the slides later, here's the URL.
    * It'll be in the lower right corner.
* Hit `P` for presenter notes.
    * Notes have links to things I reference.
    * Notes have more info than I'll talk about in some cases.
* My Twitter is in the upper right corner if you want to tweet at/about me.

---
class: middle, center, craig-heart-ruby

![Craig](images/booch.png) + ![Ruby](images/Ruby_logo.svg) = ![Heart](images/heart.svg)

???

* I love Ruby.
* I've been using Ruby since 2005.
* I'm not sure I'll ever like another language as much as Ruby.
    * I'm writing my own language.
        * I'm not even confident I'll like *it* more than Ruby.

---
class: image-only

![Strange Loop logo](images/strange-loop-logo.jpg)

???

* I first came up with the idea for this talk while attending Emerging Languages Camp.
    * In 2013.
        * ELC was co-located with Strange Loop in 2012 and 2013.
            * I don't think I attended in 2012.
* Basically some thought experiments about what Ruby would have looked like if designed today.
    * What if Matz had made some different choices?
    * Especially big things like immutability, types, and concurrency.

---
class: image-only

![Yukihiro "Matz" Matsumoto doing Q&A at RubyConf 2017](images/matz-rubyconf-2017-q-and-a.jpg)

???

* The next time I thought about it was at RubyConf.
    * Matz was answering a question about what features he regretted adding to Ruby.

---
class: image-only

![Stone programming language logo](images/stone-logo.jpg)

???

* I've also been thinking for quite a while about programming language design.
* Not in an academic sense, but what works practically for programmers.
* Since I love Ruby, my language design starts there, but diverges in some significant ways.
* This talk is NOT about Stone.
    * It's about more realistic changes that might be applied to Ruby.

---
class: middle, center, craig-heart-ruby

![Craig](images/booch.png) + ![Ruby](images/Ruby_logo.svg) = ![Heart](images/heart.svg)

???

* So I love Ruby.

---

# But...

???

* But not EVERYTHING about Ruby.
* Ruby has some things that aren't so great.

---

# What Was Matz Thinking?

~~~ ruby
$foo = 123
$: << "./lib"  # Add a directory to the load path.
$LOAD_PATH  # See the load path.
$*  # ARGV (command-line arguments).
%w[a b c].join  # => "abc"
$, = ", "  # Set join string.
%w[a b c].join  # => "a, b, c"
$_  # Last line read via `gets` or `readline`.
~~~

???

* In general, global variables are frowned upon.
    * They lead to non-local effects.
        * Breaks encapsulation.
        * Makes things very difficult to troubleshoot.
    * Global constants are fine -- they don't have most of the issues.
* That last one isn't technically even global.
    * It's one of a few that are lexically scoped.
* Perl-style (symbolic) globals are especially ugly.
    * If you *have* to use them, use the English variants.
        * Now included automatically.
            * Used to have to `require "english"` to get them.
        * See https://ruby-doc.org/stdlib-2.0.0/libdoc/English/rdoc/English.html.
* See https://ruby-doc.org/core-2.5.1/doc/globals_rdoc.html for the full list.

---

# What Was Matz Thinking?

~~~ ruby
=begin
This is a comment.
=end

def my_method
  =begin
  This is NOT a comment.
  The `=begin` is a syntax error.
  =end
end
~~~

???

* Ruby has block comments, but they're ugly and hard to use.
    * So weird - they have to start at the beginning of the line.
* Has anyone here ever used these?
* Who even knew these existed?


* Surprisingly, Atom knows how to correctly syntax highlight them.
    * The syntax highlighting in the presentation doesn't get it quite right.

---

# What Was Matz Thinking?

~~~ ruby
puts DATA.read
__END__
The interpreter will ignore all of this text.
This will be part of the output.
Everything to the end of the file is part of `DATA`.
~~~

???

* This program will print lines 3 through 5.
* Note that you can only have 1 data block in a file.
    * It always reads EVERYTHING from __END__ to the end of the file.
* I can see a use for data blocks, but they're kinda weird.
    * Why not just load the text from a separate file?
* Who knew about this feature?
    * How often have you used it?

---

# What Was Matz Thinking?

~~~ ruby
class Polygon
  @@sides = 10
  def self.sides
    @@sides
  end
end

Polygon.sides # => 10

class Triangle < Polygon
  @@sides = 3
end

Triangle.sides # => 3
Polygon.sides # => 3
~~~

???

* Class variables aren't very useful.
    * They interact poorly with inheritance.
    * They're shared between the class and all its subclasses.
* Class variables are available to both instance methods and class methods.

---

# What Was Matz Thinking?

~~~ ruby
class Polygon
  @sides = 10
  def self.sides
    @sides
  end
end

Polygon.sides # => 10

class Triangle < Polygon
  @sides = 3
end

Triangle.sides # => 3
Polygon.sides # => 10
~~~

???

* Use "class instance variables" instead.
    * Note that they can only be referenced from class methods.

---

# Planned Obsolescence

~~~ ruby
for i in 1..6
  puts i
end

(1..6).each do |i|
  puts i
end

1.upto(6).each do |i|
  puts i
end
~~~

???

* How many times have you used `for` / `in` in the past year?
    * I've not used it once I learned about `each`.
    * I'm not even planning to put `for` loops in my own Ruby-derived language.

---

# Planned Obsolescence

~~~ ruby
END { puts "END" }
puts "hello"
BEGIN { puts "BEGIN" }

# Prints "BEGIN", then "hello", then "END".
~~~

???

* Has anyone ever used `BEGIN` or `END`?
* They're used to run code before/after the program starts/finishes.
* A program may include multiple BEGIN and END blocks.
    * `BEGIN` blocks are executed in the order they are encountered.
    * `END` blocks are executed in reverse order.
* Usually used when using Ruby to process text like Awk.
    * I.e. when running `ruby -n`.
        * Puts an implicit `while gets(); ... end` around the code.

---

# Planned Obsolescence

Ruby 2.0+

~~~ ruby
?a        # => "a"
?a + ?b   # => "ab"
?a.class  # String
??        # => "?"
?\t       # => "\t"
?\111     # => "I" (octal)
?\C-x     # => "\u0018" (control-X)
~~~

Ruby 1.8

~~~ ruby
?a         # => 97
?a.class   # => Fixnum
"test"[0]  # => 116
~~~

???

* Character literals are just strings in Ruby 1.9 and newer.
* They used to be Integers.

---

# Planned Obsolescence

~~~ ruby
square = proc{ |x| x * x }
square.(2)      # => 4
square.call(2)  # => 4
square = Proc.new{ |x| x * x }
square.(2)      # => 4
square.call(2)  # => 4
~~~

~~~ ruby
square = ->(x){x * x}
square.(2)      # => 4
square.call(2)  # => 4
square = lambda{ |x| x * x }
square.(2)      # => 4
square.call(2)  # => 4
~~~

???

* Ruby introduced "stabby lambda" in 1.9.
* In a lambda, the return statement returns only from the block itself.
* In `Proc.new`, the return statement returns from the method enclosing the proc.
* It's recommended not to use the `proc` method call.
* Lambdas error out if given the wrong number of arguments.
    * Procs will just fill the missing arguments with `nil`.
* Today, we'd probably just have stabby lambdas.

---

# Hmm...

~~~ ruby
autoload :MyLibrary, "mylibrary"

x = MyLibrary.new(123) # Causes `load "mylibrary"`.
~~~

???

* Using `load` is like `require`.
    * But will re-load the file, even if it's already been loaded.
* I'll just say that explicit is usually better than implicit.
* Deprecated, but not removed.
    * It *might* get removed in 3.0.
    * https://bugs.ruby-lang.org/issues/5653

---

# Hmm...

~~~ ruby
def const_missing(const_name)
  from_mod = anonymous? ? guess_for_anonymous(const_name) : self
  Dependencies.load_missing_constant(from_mod, const_name)
end

class Application < Rails::Application
  config.autoload_paths += ["#{config.root}/app/decorators"]
end
~~~

???

* Rails uses `const_missing` instead.
* Note that `autoload_paths` does not use Ruby's `autoload`.

---

# But...

![Matz, Ruby author](images/Ruby_matz_03.jpg)

???

* Matz does not want to break backwards compatibility.
    * He's quite worried about the "Python 3 effect".

---

# Immutable strings

~~~ ruby
s = "Hello, Craig"
s.gsub("Craig", "Ruby!")
s  # => "Hello, Craig"
s.gsub!("Craig", "Ruby!")
s  # => "Hello, Ruby!"
~~~

~~~ ruby
s = "Hello, Craig".freeze
s.gsub!("Craig", "Ruby!") #! FrozenError: can't modify frozen String
~~~

???

* In Ruby, `freeze` makes an object immutable.
* We have immutable strings as of Ruby 2.3 -- sort of.
    * Requires a "magic" comment.
        * Note that it's **singular** `literal`.
            * Which I can never remember.
    * Or `--enable-frozen-string-literal` from command line.
        * But that will break **many** existing gems.
    * Might become the default in Ruby 3.0.
* This is actually **only** string literals.
    * I'm actually talking about *all* strings.

---

# Immutable strings

~~~ ruby
# frozen_string_literal: true
s = "Hello, Craig"
s.gsub!("Craig", "Ruby!") #! FrozenError: can't modify frozen String
buffer = ""
buffer << "Craig"  #! FrozenError: can't modify frozen String
buffer += "Craig"
buffer  # => "Craig"
~~~

~~~ ruby
user["name"]
user["name".freeze]
~~~

???

* In Ruby 2.2, string literals used as hash keys get frozen automatically.
    * The strings aren't used elsewhere, so there's no harm.
* What advantages does immutability give us?
    * Easier for programmers and computer to reason about values.
        * A method call cannot modify its arguments.
        * Transformations versus mutations.
    * Can pass values between threads without fear of another thread changing something.
        * Can copy by reference, improving performance.

---

# Immutable Arrays and Hashes

~~~ ruby
x = [[1], 2, 3].freeze
x[0] = 0  # => FrozenError: can't modify frozen Array
x[0][0] = 0
x  # [[0], 2, 3]
~~~

~~~ ruby
h = {a: 1, b: 2}
h[:a]  # => 1
h[:a] = 2
h[:a]  # => 2
~~~

???

* Freezing in Ruby only effects a single level.

---

# Immutable Arrays and Hashes

~~~ ruby
require "hamster"

hash = Hamster::Hash[name: "Simon", gender: :male]
vector = Hamster::Vector[1, 2, 3, 4]
list = Hamster::List[1, 2, 3]
~~~

???

* Gem named Hamster provides Ruby with immutable data structures today.
    * I recently realized it's named after the term _HAMT_.
        * [HAMT = hash array mapped trie](https://en.wikipedia.org/wiki/Hash_array_mapped_trie).
* Another gem named immutable-ruby.
* Rubinius implementation of Ruby has HAMT as primitives.
* Dave Morse gave a talk on HAMTs about a year ago.
* HAMTs are also called:
    * _persistent data structures_
    * _purely functional data structures_
* I first learned about these at Strange Loop 2011.
    * Daniel Spiewak talk [Extreme Cleverness: Functional Data Structures in Scala](https://www.infoq.com/presentations/Functional-Data-Structures-in-Scala).
* Canonical reference is Purely Functional Data Structures book by Chris Okasaki.
* HAMTs have *very* good performance in almost all circumstances.
    * Most functions are O(log n), with n <= 7 (which is pretty close to O(1)).

---

# HashWithIndifferentAccess

~~~ ruby
h = {a: 123, b: 456}
h[:a]  # => 123
h["a"]  # => nil
~~~

~~~ ruby
require "active_support/hash_with_indifferent_access"
h = HashWithIndifferentAccess.new(a: 123, b: 456)
h[:a]  # => 123
h["a"]  # => 123
~~~

???

* Rails has a class named HashWithIndifferentAccess.
* It's a bit of a mess.

---

# HashWithIndifferentAccess

~~~ crystal
h = Hash.new(a: 123, b: 456){ |h, k| h[k.to_s] }
h["a"]  # => 123
h[:a]  # => 123
~~~

???

* Crystal has a much better solution.
    * New up the hash with a block to convert the key.
        * The block takes the hash itself and the key.
* NOTE: This is probably not 100% legal Crystal syntax.
    * Probably have to specify the key and value types: `Hash(String, Int32)`.
    * Probably can't specify initial values *and* default block.
        * Not sure you can even specify initial value like that.

---

# Auto-initializing Variables

~~~ ruby
class MyClass
  def initialize(a, b)
    @a = a
    @b = b
  end
end
~~~

???

* We run into this pattern quite often in Ruby.

---

# Auto-initializing Variables

~~~ ruby
class MyClass
  def initialize(@a, @b)
  end
end
~~~

???

* CoffeeScript and Crystal allow a simplified syntax for this common pattern.
* I don't see any good reason that this could not be added to Ruby.
    * Possibly some difficulty in updating the parser.

---

# First-class Blocks

~~~ ruby
square = { |x| x * x }
# => SyntaxError: unexpected '}', expecting end-of-input

def abc(&block1, &block2)
end
# => SyntaxError: unexpected ',', expecting ')'

{ x = 1 }.methods
# => SyntaxError: unexpected '}', expecting =>
~~~

???

* Blocks in Ruby are not first-class.
    * You can't assign them to a variable.
    * You can't pass more than 1 to a method.
    * Can't pass a block as a named argument.
    * You can't call a method on a block literal.

---

# First-class Blocks

~~~ ruby
def if(condition, &then:, &else:)
end

if(x < 10, then: {puts "small"}, else: {puts "LARGE"})

{puts "LARGE"}.if(x >= 10)
~~~

???

* My proposal is to allow things like these.
* This might be a bigger syntactic change than Matz is ready for.
* The first might have issues with ambiguity determining if `{}` contain a block or a hash.

---

# Pipes

~~~ ruby
g(f(x))
f(x) |> g
~~~

???

* This syntax comes from F# originally.
* Popular in Elixir and Elm.
* Can think of it like pipes in UNIX shell.
* Not likely to ever work in Ruby.
    * Because Ruby would want to execute the `g` with 0 arguments first.
        * Unless there's a way to do something tricky with operator/method-call precedence.

---

# Pattern matching / Destructuring

~~~ ruby
a, b, c = [:hello, "world", 42]
a  # => :hello
b  # => "world"
c  # => 42
[a, b, c] = [:hello, "world", 42]
# => SyntaxError: unexpected '=', expecting end-of-input
a, *b, c = [:hello, "Craig", "Cheryl", "Amos", 42]
b  # => ["Craig", "Cheryl", "Amos"]
~~~

???

* Ruby has *a little* pattern matching.
    * But it's pretty limited.

---

# Pattern matching / Destructuring

~~~ ruby
[:hello, b, _] = [:hello, "world", 42]
b  # => "world"
[:goodbye, b, _] = [:hello, "world", 42]
# => MatchError: :goodbye does not match :hello

case x
when [:ok, result]
  result
when [:error, error]
  raise error
end
~~~

???

* My proposal.
    * Mostly stolen from Elixir.

---

# Pattern matching / Destructuring

~~~ ruby
{a: a, b: b, "c" => c} = {a: 1, b: 2, "c" => 3}
a  # => 1
b  # => 2
c  # => 3

case x
when {ok: result}
  result
when {error: error}
  raise error
end
~~~

???

* My proposal.
    * Mostly stolen from Elixir.

---

# Tail call optimization

~~~ ruby
def factorial(n)
  return 1 if n <= 1
  n * factorial(n - 1)
end
factorial(20000)
# => SystemStackError: stack level too deep
~~~

???

* Tail call optimization is useful for recursively-defined functions.
* TCO only works when the recursive call is at the *end*.
    * Hence "tail call".
    * And without any additional computations performed on the result.
        * So it would NOT work with this example.
* Sometimes called tail recursion elimination (TRE).

---

# Tail call optimization

~~~ ruby
RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true
}
def factorial(n, a=1)
  return a if n <= 1
  factorial(n-1, n*a)
end
factorial(20000) # Doesn't crash now!
~~~

???

* Ruby *does* support TCO, but only after jumping through some hoops.
* Here, we've rewritten `factorial` in "continuation passing style".
* TCO automatically converts the recursive call to a "jump" to itself.
    * In this case, it can just set `n` and `a` and jump to the first line of the method.
* Matz said he regrets not supporting this better.
* Can be difficult to be sure of tail calls.
    * Ruby is so dynamic, `factorial` may have been redefined within the body.
* One downside: eliminates full stack trace.
    * This is why Python does not support TCO.
* Guido von Rossum on why he doesn't support it in Python: http://neopythonic.blogspot.com/2009/04/tail-recursion-elimination.html
* Recursion can also make things harder to read.
    * It'd be more clear to use iteration in many cases.
        * In this case: `(1..n).inject(:*)`
* Koichi's explanation: https://bugs.ruby-lang.org/issues/6602
* I think it *might* be possible to automatically turn *many* recursive functions to iterative.
    * Not just tail-calls.
    * Early chapters/videos of SICP show manual transformations.

---

# Static Null Checking

~~~ ruby
require "socket"

server = TCPServer.new(8080)
socket = server.accept
line = socket.gets
puts line.capitalize
~~~

???

* There's a bug in this code.
* `Socket#gets` might return `nil`.
    * So the `line.capitalize` will raise an exception.
        * `undefined method 'capitalize' for nil:NilClass`
        * Also known as a _null pointer exception_ in other languages.
* Believe it or not, we could actually detect this at compile time.
    * As long as we know that `Socket#gets` can return a `nil`.
* Crystal is a very Ruby-like language that does this kind of null checking.
    * It will fail at compile time.

---

# Static Null Checking

~~~ ruby
require "socket"

server = TCPServer.new(8080)
socket = server.accept
line = socket.gets
if line
  puts line.capitalize
else
  puts "Nothing in the socket"
end
~~~

???

* Crystal will allow this code.
    * Because there's a check of and handling of the `nil` case.
* This does require some type checking.
    * Could be added to Ruby 3.0 pretty easily.
        * Assuming we get *any* type-checking in Ruby 3.0.

---

# Static Type Checking

* Helps with API design
* Easily finds an entire class of bugs
* Automatically-checked documentation

???

* Gradual typing
    * Can get some benefits without typing *everything*.
* Soft typing
    * No type annotations, minimal inference.
        * TypeScript can be used in this way.
* Ruby makes static typing *really* hard.
    * Methods can be dynamically created at runtime.
        * Lots of this in Rails.

---

# Static Type Checking (Sorbet)

~~~ ruby
class MyClass

  sig {params(a: Integer).returns(String)}
  def bar(foo)
    foo.to_s
  end

end
~~~

???

* Stripe Sorbet
    * They have millions of lines of Ruby code.
    * They have hundreds of engineers.
* Presentations:
    * [Ruby Kaigi 2018](https://www.youtube.com/watch?v=eCnnBS2LXcI)
    * [Strange Loop 2018](https://sorbet.run/talks/StrangeLoop2018/)
* Not yet released as Open Source.
* Does static checking.
    * But also does *some* runtime checking.
        * For when untyped code calls into typed code.
            * Because the typed code is otherwise unprotected in that case.
* Tools to suggest types to add.
* Helpful at finding bugs in non-happy-path.

---

# Static Type Checking (Sorbet)

~~~ ruby
#
# Basic checks such as syntax errors are enabled by default

# typed: true
# Enables type checking

# typed: strict
# Additionally requires all method definitions to be typed

# typed: strong
# The safest level: disallows calling untyped code
~~~

???

* Different levels of checking.
* Tools to suggest types to add.
* Helpful at finding bugs in non-happy-path.

---

# Static Type Checking (RDL)

~~~ ruby
require "rdl"
require "types/core" # Types for Ruby core libraries.
include RDL::Annotate

type "(%any) -> Integer", typecheck: :now
def the_answer(x)
  "forty-two"
end
# => RDL::Typecheck::StaticTypeError
#     Got type String where Integer was expected.

type Integer, :+, "(Integer) -> Integer"

def the_answer(x)
  41 + 1
end

type Integer, :/, "(Integer) -> Integer or Rational"
~~~

???

* RDL by Jeffery Foster.
    * Jeff's 5th attempt.
* Presentation at [Strange Loop 2017](https://www.youtube.com/watch?v=buY54I7mEjA).
* Types for libraries can be loaded separately from the libraries.
    * This is working very well for TypeScript.
* Also has contracts.
    * Pre- and post-conditions.
        * Checked dynamically.
    * Uses a pre-condition to add dynamic type-checking when dynamically adding a method.
        * See video, 27 minutes in.
        * This is the big leap forward for RDL.
* Has support for duck typing.
    * AKA structural types -- specify fields/methods the argument must have.
        * As opposed to nominal types - types specified by name.
* Also see http://www.eecs.tufts.edu/~jfoster/papers/pldi16.pdf.

---

# Static Type Checking (Ruby 3.0)

* Matz says:
    * "We are not going to add any kind of type annotation to Ruby."
    * "But we are trying to add type inference (both static and dynamic)."

???

* Ruby [issue 9999](https://bugs.ruby-lang.org/issues/9999):
    * "Type Annotations (Static Type Checking)"
* JavaScript has TypeScript and Flow.
* Python has MyPy.
* PHP has Hack.
* Crystal does almost 100% structural typing, with inference.
* I hope Ruby is a mix of Crystal and TypeScript ideas.

---

# Object#in?

~~~ ruby
[1, 2, 3, 4, 5].include?(10)

10.in?([1, 2, 3, 4, 5])
~~~

???

* This one is really just a pet peeve of mine.
* We often think of asking "is this thing a part of this other thing?"
    * But Ruby only allows "does this other thing contain this thing?"
* Yes, they're equivalent.
    * But they look at the question from the viewpoint of different objects.
* Yes, it's easy to add this to `Object`, due to open classes in Ruby.
    * But it's not nice to re-open/pollute deeply into the core library like that.
        * Has issues if 2 libraries try to make a similar change.
* Maybe I could have it using Ruby refinements.

---

# Annotations

~~~ ruby
private def abc
  "abc"
end

def ghi
  "ghi"
end
memoize :ghi

memoize def jkl
  "jkl"
end

memoize_n(123, def xyz
  "xyz"
end)
~~~

???

* We actually already kind of have this, but could use it more.
    * We call them method decorators.
* This works because `def` returns the name of the method (as a symbol).
* Found one to do TCO.
    * http://nithinbekal.com/posts/ruby-tco/

---

# Annotations

~~~ ruby
desc "This runs the bar task."
task :bar
  puts "Running 'bar'"
end
~~~

???

* This pattern requires setting and reading a global variable.
    * Because the `desc` and `task` lines have no actual association with each other.

---

# Annotations

~~~ ruby
@desc "This runs the bar task."
@memoize
task :bar
  puts "Running 'bar'"
end
~~~

???

* My proposal.

---

# Concurrency

* concurrent-ruby
* Erlang/Elixir concurrency model

---

# The Future

* What might Ruby evolve to?
* What are some possible paths forward?
* How can we make Ruby better?
* How can we derive more joy from programming?

???

* I'd like to advocate for a faster pace of changes.
    * So that Rubyists don't feel like we're stuck with trailing edge tech.

---

# Feedback

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Slides: http://craigbuchek.com/ruby-reimagined
    * Source: https://github.com/booch/presentations

???

* I'm hoping to refine this and give it at a conference.
    * So please give me feedback.

------

* I used a tool called [Remark][remark] to create and show these slides.


[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[craigbuchek]: http://craigbuchek.com
[boochtek]: https://www.boochtek.com
[tal]: http://www.thisagilelife.com


[remark]: http://remarkjs.com/
