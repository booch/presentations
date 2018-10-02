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
class: middle, center

* TODO: Images for Ruby + Craig = Heart

???

* I love Ruby.
* I've been using Ruby since 2005.
* I'm not sure I'll ever like another language as much as Ruby.
    * I'm writing my own language.
        * I'm not even confident I'll like *it* more than Ruby.

---

* TODO: Image for Emerging Languages Camp

???

* I first came up with the idea for this talk while attending Emerging Languages Camp.
* Basically some thought experiments about what Ruby would have looked like if designed today.
    * What if Matz had made some different choices?
    * Especially big things like immutability, types, and concurrency.

---

* TODO: Matz doing Q&A (RubyConf 2017?)

???

* The next time I thought about it was at RubyConf.
    * Matz was answering a question about what features he regretted adding to Ruby.

---

* TODO: Stone logo

???

* I've also been thinking for quite a while about programming language design.
* Not in an academic sense, but what works practically for programmers.
* Since I love Ruby, my language design starts there, but diverges in some significant ways.
* This talk is NOT about Stone.
    * It's about more realistic changes that might be applied to Ruby.

---

class: middle, center

* TODO: Images for Ruby + Craig = Heart

???

* So I love Ruby.

---

But...

???

* But not EVERYTHING about Ruby.
* Ruby has some bad parts.

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

* Obsolete keywords (like `BEGIN`, `END`, `for`, `in`)

---

# Planned Obsolescence

* Character literals (`?a`)

---

# Planned Obsolescence

* Procs (in favor of lambdas)

---

# Hmm...

* Autoloading

---

# But...

???

* Matz does not want to break backwards compatibility.
    * He's quite worried about the "Python 3 effect".

---

# Immutable strings


---

# Immutable Arrays and Hashes


---

# Static Null Checking

* Like Crystal

---

# HashWithIndifferentAccess

* Crystal's solution

---

# Auto-initializing Variables

* `@` in parameters list
* Like CoffeeScript and Crystal

---

# First-class Blocks

---

# Concurrency

* concurrent-ruby
* Erlang/Elixir concurrency model

---

# Pipes

* F#, Elixir, Elm

~~~ ruby
g(f(x))
f(x) |> g
~~~

---

# Pattern matching / Destructuring

---

# Tail call optimization

---

# Type Checking

* Various attempts
    * TODO: List main ones
        * Stripe's
        * Previous attempts (from previous Strange Loop)
        * MRI 3.0
* TypeScript

---

# Object#in?

* Not having this is a pet peeve of mine

---

# Annotations

* We actually already kind of have this, but could use it more

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
