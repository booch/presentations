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
* Basically some thought experiments about what Ruby would have looked like if desinged today.
    * What if Matz had made some different choices?
    * Especially big things like immutability, types, and concurrency.

---

* TODO: Matz doing Q&A (RubyCOnf 2017?)

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
* Perl-style globals
* Global variables (at least the Perl-derived ones)
~~~

---

# What Was Matz Thinking?

~~~ ruby
* Class (`@@`) variables
~~~

---

# What Was Matz Thinking?

~~~ ruby
* Block comments (`=begin`, `=end`)
~~~

---

# What Was Matz Thinking?

~~~ ruby
* Data blocks (`DATA` and `__END__`)
~~~

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
