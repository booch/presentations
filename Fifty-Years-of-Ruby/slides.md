---
title: 'Fifty Years of Ruby'
author: 'Craig Buchek'
description: 'The history, present, and future of the Ruby programming language'
marp: true
paginate: false
header: 'https://craigbuchek.com/fifty' # Left header
footer: '@CraigBuchek' # Left footer
# backgroundImage: 'linear-gradient(to bottom, #67b8e3, #0288d1)'
url: https://craigbuchek.com/fifty
---
<!--
_class: title lead
-->
![bg](assets/RubyConf-2024-background-title.png)

# Fifty Years of Ruby

## Craig Buchek

### RubyConf 2024

<!-- 
- Follow along, or look at slides later
    - Short URL in upper left
    - Hit `P` to toggle presenter notes
        - Also links to resources
        - ... and some details that I don't have time to cover
-->

---
#### 1971

> The best way to predict the future is to invent it.

<cite>Alan Kay</cite>

<!--
- Hi, I'm Craig!
- Today, I'm going to talk about:
    - ideas that led to us being here today
    - how we got here
        - people who had a vision of future
        - how they shaped computers we use today
        - how they shaped Ruby
    - what Ruby's future might look like

------

- If you want to "at" me, ...
    - I'm on Twitter and Mastodon via ruby.social
        - ... infrequently
-->

---
<!--
_backgroundColor: black
_class: dark
-->
#### 1993
![bg 60% Yukihiro "Matz" Matsumoto speaking in 2011](assets/Yukihiro-Matsumoto-2011.jpg)

<!--
- We're all here today because...
- February 24, 1993
    - Japanese programmer YukiHIRO MatsuMOTO
        - inspired to write programming language
        - "Matz"
- Influenced by:
    - Perl, Smalltalk, Eiffel, Ada, Lisp
- I will dig into Smalltalk
    - most similar to Ruby

------

- Image credit: https://upload.wikimedia.org/wikipedia/commons/5/5a/Yukihiro_Matsumoto_EuRuKo_2011.jpg
-->

---
<!-- _class: dark -->
#### 1968
![bg](assets/mother-of-all-demos-keyboard.jpg)

<!--
- My story starts: 1968
    - Most of us here weren't born yet
- ACM conference in San Francisco
    - ACM = Association for Computing Machinery
- Douglas EngelBART
    - Augmentation Research Center (ARC)
        - Stanford Research Institute (SRI)
    - Showed their NLS (oN-Line System)
- Innovations:
    - Key chorder
        - Thing on left
    - Mouse
        - Actually invented in 1963
    - Personal computing
    - Real-time video conferencing
    - Interactive editing
    - Remote networking
- Hands in vs hands out
- Steven Levy dubbed it "the Mother of all Demos"
    - _Insanely Great_, 1994
- TODO: Tell them to watch the video (or fit 1 minute of it in)

------

- TODO: Link to videos and articles
- TODO: Link to "Augmenting Human Intellect: A Conceptual Framework" (1962)
- Photo credit: https://qph.cf2.quoracdn.net/main-qimg-401017ddb89209598d6f0f9b74f5a1d8
-->

---
<!-- _class: dark -->
![bg](assets/Alan_Kay_and_the_prototype_of_Dynabook_v5.jpg)

<!--
- Attendee at MoAD:
    - Alan Kay
- Degree in Molecular Biology

------

- https://tinlizzie.org/IA/index.php/Talks_by_Alan_Kay
- https://www.quora.com/profile/Alan-Kay-11
- Photo credit: https://commons.wikimedia.org/wiki/File:Alan_Kay_(3097597186)_(cropped).jpg
- Alan's career:
    - Stanford AI Lab (1969)
    - Xerox PARC (1970-1981)
    - Atari (1981-1984)
    - Apple (1984-1996)
    - Disney (1997-2002)
-->

---
#### 1968
![bg height:90%](assets/First-Dynabook-idea.webp)

<!--
- 1968: Alan Kay had idea
    - This cartoon and cardboard mockup
- First paper on it: 1972
    - Named it Dynabook
- Inspired by seeing Logo turtle graphics used in classrooms
- Original innovation: idea of personal computer for children

------

- Image credit: https://www.quora.com/What-lessons-were-learned-in-aspiring-towards-the-DynaBook-and-have-any-of-its-original-goals-become-dated/answer/Alan-Kay-11
-->

---
<!-- _class: dark -->
#### 1969
![bg width:100%](assets/PARC-sign.webp)

<!--
- 1969: Xerox opened its Palo Alto Research Center
    - PARC
    - Palo Alto in Silicon Valley
- Alan Kay joined, 1970
- Lots of people from SRI's Augmentation Research Center
    - People from Engelbart's lab
- Innovations:
    - Laser printer
    - Ethernet

------

- Image source: https://www.techspot.com/articles-info/477/images/2015-09-30-image.jpg
-->

---
# Smalltalk-71

~~~ smalltalk-71
to T 'and' :y do 'y'
to F 'and' :y do F

to 'factorial' 0 is 1
to 'factorial' :n do 'n*factorial n-1'

to 'fact' :n do 'to 'fact' n do factorial n. ^ fact n'
~~~

<!--

-->

---
# Smalltalk-72

~~~ smalltalk-72
to square
  (do 4
    (😀 go 50 turn. 90))

to square length
  (👉length 🠔 :.
    do 4 (😀 go length turn 90))!

to poly sides size
  (👉sides 🠔 :. 👉size 🠔 :.
    do sides (😀 go size turn 360/sides))!

to for token step stop var start exp (:👉var.
  (∢←⇒(:start.) 👉start←1).
  (∢to⇒(:stop.) 👉stop←start).
  (∢by⇒(:step.) 👉step←1).
∢do. :#exp. CODE 24)
~~~

<!--
- Some notes:
    - `to` is equivalent to Ruby's `def`
    - 😀 was called smiley
        - 😀 is instance of turtle class
    - Looks a bit Lispy with the nested parens
    - This is 100% accurate UTF transliteration
    - TODO: Understand definition of `for`, `∢`, `do`, and `:#exp`
- Already had `self`

------

- Source: https://smalltalkzoo.thechm.org/papers/EvolutionOfSmalltalk.pdf
-->

---
<!-- _class: dark -->
#### 1973
![bg height:151%](assets/xerox-alto.webp)

<!--
- 1973
- Xerox Alto
    - "The Interim Dynabook"
    - $32k ($200k+ today)
    - 96kB RAM (up to 512kB)
    - 2.5 MB removable hard drive
    - About 2000 made
        - Mostly used at Xerox and universities
        - Not intended for commercial sale
    - GUI
        - "portrait" orientation
            - like we normally use paper
        - 606x808 pixels
            - 72 dpi b/w bitmapped screen
    - First WYSIWYG editor
        - Bravo
        - Charles Simonyi
            - Went on to write Microsoft Word
    - Keyboard, mouse (3 buttons), key chorder (5 keys)
    - Size of a small refrigerator
    - Ethernet

------

- Introduced March 1, 1973
- 1981: Xerox Star
    - Sold commercially
    - $16k ($50k+ today)
    - Same year as IBM PC ($2k)
    - Part of a $75k system
        - "Office of the future"
        - Server
        - Laser printer
- Also inspired SUN workstations
    - Stanford University Network
- https://en.wikipedia.org/wiki/PARC_(company)
- https://en.wikipedia.org/wiki/List_of_people_associated_with_PARC
- PARC campus photo credit: https://preview.redd.it/kjl8la0xow191.jpg?width=900&format=pjpg&auto=webp&s=bc4dfbff6ada4007fdf27ed9fed8dcdbee6ed12e
- Xerox Alto photo credit: https://crm.org/articles/xerox-parc-and-the-origins-of-gui
-->

---
# Smalltalk-76
![Smalltalk-76 GUI](assets/Smalltalk-76-UI.jpg)

~~~ smalltalk-76
Class new title: 'Point';
 fields: 'x y'. "Cartesian coordinates"

Access to fields
x [⇑x]
y [⇑y]
x: x y: y

Testing
≤pt  "return true if I am below/1eft of pt"
    [⇑x≤pt x and: y≤pt y]

Point arithmetic
+ pt [⇑Point new x: x+pt x y: y+pt y]
- pt [⇑Point new x: x-pt x y: y-pt y]
* scale [⇑Point new x; x*scale y: y*scale]
~~~

- TODO: Move image up

<!--
- All in an IDE in a full GUI windowing system
    - overlapping windows
    - different size fonts, bold, italic
- Source: https://smalltalkzoo.thechm.org/papers/The%20Smalltalk-76%20Programming%20System.PDF
- Dan Ingalls designed Smalltalk-76
    - more of a compromise between the Lisp and Algol worlds
        - brilliant design; not much flexibility was lost
    - almost 200 times faster than Smalltalk-72
-->

---
# Smalltalk-80

TODO

<!--
- Smalltalk-80: first public release
- Added blocks, booleans, meta-classes
- Introduced MVC (model-view-controller)
-->

---
#### 1981
![magazine: August 1981 issue of Byte magazine, introducing Smalltalk](assets/Byte-1981-08-Smalltalk.jpg)
Byte-1981-08-Smalltalk.jpg

<!--
- August 1981
- Byte magazine
- Included 13 articles on Smalltalk and OOP
    - "a large number of the personal computers of tomorrow" ...
    - "will be designed with knowledge gained from the development of the Alto."

------

- Previous August issues of Byte covered:
    - 1977: APL
    - 1978: Pascal
    - 1979: Lisp
    - 1980: Forth
- Later August issues covered:
    - 1982: Logo
    - 1983: C
    - 1984: Modula-2
    - 1985: Declarative languages
        - Also intro of Commodore Amiga
    - 1986: Object-Oriented Languages
    - 1987: Prolog
- Source: https://archive.org/details/byte-magazine-1981-08
-->

---
#### 1983
![book: Smalltalk-80 The Language and Its Implementation](assets/Smalltalk-80-book.jpg)

<!--
- First Smalltalk book, 1983
- Adele Goldberg
    - Xerox PARC
    - One of the designers/implementers of Smalltalk
- Several in a series
-->

---
#### 1984
![bg original Macintosh with keyboard, mouse, and floppy drive](assets/Macintosh.jpg)

<!--
- 1984: Macintosh
- Steve Jobs and Apple folks visited PARC in 1979 (twice)
    - Xerox received some Apple stock options
    - Smalltalk-76, networking, mouse-driven WYSIWYG GUI
    - Inspired the Lisa and Mac
    - Jobs later said:
        - "Xerox could have owned the entire computer industry,"
        - "could have been the IBM of the nineties,"
        - "could have been the Microsoft of the nineties."
- Alan Kay joined apple in 1984
    - Had been at Atari for a few years
    - Stayed until 1996

------

- Kay on Mac:
    - "The Mac was a failure in the sense that it didn't achieve the goal of changing the way people think about computers."
        - Me: LOLWAT!!!?????
    - "The Mac was a success in the sense that it was a very good implementation of the ideas that were around at the time."
-->

---
#### 1991
![book: Programming Perl 1st edition](assets/Programming-Perl-1st-edition.jpg)

<!--
- Perl 4 released
    - March 21, 1991
    - Larry Wall
    - Started on Perl in 1987
- designed so computer programmers could write programs more quickly and easily
    - "Easy things should be easy and hard things should be possible"
- More complete scripting language than shell, sed, awk
- Programming Perl "camel book" released
    - January 1991
    - O'Reilly publishing
    - Larry Wall & Randal Schwartz
- Perl 5 released October 17, 1994
    - Added objects (among other features)

------

- Image source: https://en.wikipedia.org/wiki/Programming_Perl
-->

---
#### 1993
# Matz starts working on Ruby

<!--
- "more powerful than Perl, and more object-oriented than Python"
-->

---
#### 1995
# Matz Ruby 0.95 to Japanese newsgroup

---
#### 1996
![Squeak web site](assets/Squeak.png)

<!--
- 1996
- Apple
    - Dan Ingalls
    - Alan Kay
- Squeak
    - Modern portable Smalltalk
    - Written in Smalltalk
    - Compiles to C
- Moved to Disney in 1997
- More movement towards Dynabook
- Scratch visual programming language

------

- Primary source: https://dl.acm.org/doi/pdf/10.1145/263698.263754
- Source: https://en.wikipedia.org/wiki/Squeak
- Image source: https://squeak.org/
-->

---
#### 1996
![book: Smalltalk Best Practice Patterns](assets/Smalltalk-Best-Practice-Patterns.jpg)

<!--
- October 3, 1996
- IMHO, one of the best "Ruby" books
- Design patterns "in the small"
- Kent Beck
    - Agile Manifesto
    - Extreme Programming
    - Wrote _the_ book on Test-Driven Development
    - JUnit
-->

---
#### 1996
# Ruby 1.0

<!--
- December 25
-->

---
#### 1997
# Matz starts working on Ruby full-time at Netlab.jp (July)

---
#### 1998
# Ruby 1.2

- First stable release

---
#### 1999
![Japanese Ruby book](assets/Japanese-ruby-book.jpg)

<!--
- Appears to be first Ruby book published
- October 1999
- Written by Keiju Ishitsuka and Matz?

------

- Source: https://auth0.com/blog/a-brief-history-of-ruby/
- Source: https://www.amazon.co.jp/%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88%E6%8C%87%E5%90%91%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E8%A8%80%E8%AA%9E-ASCII-SOFTWARE-SCIENCE-Language/dp/4756132545
-->

---
#### 2000
![book: Programming Ruby 1st edition](assets/Programming-Ruby-1st-ed.jpg)

<!--
- December 15, 2000
- "Pickaxe book"
- First English-language book on Ruby
- Dave Thomas (Pragmatic Dave)
    - Pragmatic Programmer book
        - Coined "DRY"
    - Pragmatic Bookshelf
    - Agile manifesto (2001)
    - Brought Agile/XP practices to Ruby
- TODO: New version
-->

---
#### 2001

<div class="columns">
<div>

![Chad Fowler](assets/Chad-Fowler.jpg)

</div><div>

![David Black](assets/David-Black.jpg)

</div></div>

<!--
- April 12-13, 2001
- First International Ruby Conference
    - Tampa, FL
    - organizers
        - David Alan Black
        - Chad Fowler
        - Dave Thomas
    - later founded Ruby Central
        - nonprofit
        - future conferences
            - including this one!

------

- Image source: https://www.flickr.com/photos/elabsse/9023807719
- Image source: https://www.linkedin.com/in/dablack/
-->

---
#### 2001
# JRuby

- Runs on JVM
    - Faster
    - Java interoperability
    - Java libraries
- Jan Arne Petersen
- Charles Nutter
- Thomas Enebo

---
#### 2003
# Ruby 1.8 (August 4)

<!--
- First "modern" Ruby?
- TODO: More about this release
-->

---
<!-- _class: dark -->
#### 2004

<div class="columns"><div>

![headshot: DHH in 2017](assets/DHH-headshot-2017-full.jpg)

</div><div>

![original logo: Ruby on Rails](assets/Ruby-on-Rails-logo-original.png)

</div></div>

<!--
- 2004: Ruby on Rails
- David Heinemeier Hansson (DHH)
    - Danish programmer
    - Using Ruby since 2003
    - Was doing PHP before that
- Released Rails publicly on July 25 2004
    - MVC web framework
    - part of framework he built for Basecamp at 37 Signals
    - marketed Rails w/ 15-minute blog video
        - Fast at editing: TextMate
    - Convention over Configuration
    - Big reduction in code vs Java frameworks
    - 0.1 release was 2003
    - 0.8 release October 25, 2004
    - 1.0 release December 13, 2005

------

- Rails announcement: https://web.archive.org/web/20040823214652/http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/107370
- Original Rails blog video: https://www.youtube.com/watch?v=Gzj723LkRJY
- Made enough money to buy himself a bespoke exotic race car
    - His Wikipedia entry has much more detail on his racing career than Rails
- image credit: https://dhh.dk/images/headshot-2017-full.jpg
- image credit: https://commons.wikimedia.org/wiki/File:Ruby_on_Rails-logo.png
-->

---
#### 2005
![book: Agile Web Development with Rails, 1st edition](assets/Agile-Web-Development-with-Rails-1st-ed.jpg)

<!--
- Dave Thomas (Pragmatic Dave)
    - with DHH
- August 7, 2005
- TODO: More about this book
- TODO: New version
-->

---
<!-- _class: dark -->
#### 2007
![Avi Bryant giving keynote at RailsConf 2007](assets/Avi-Bryant-keynote-RailsConf-2007.png)

<!--
- 2007: Avi Bryant at RailsConf
- Avi Bryant
    - Seaside web framework
    - GemStone Smalltalk
    - MagLev
        - Ruby VM based on GemStone
- "Smalltalk’s Lessons for Ruby"
- Ruby IS-A Smalltalk
- Lessons the Ruby community should learn from Smalltalk
    - TODO: What are the lessons?
- TODO: Story about this talk
- TODO: Read the links below
- Source: http://lambda-the-ultimate.org/node/2573
- Source: https://www.artima.com/forums//threaded.jsp?forum=155&thread=220183
- Source: https://news.ycombinator.com/item?id=3029981
- Source: https://web.archive.org/web/20170421065632/http://blog.redtexture.net/2010/10/30/avi-bryants-presentations/#Avi%20Bryant's%20Presentations
- Source: https://www.akitaonrails.com/2007/12/21/chatting-with-avi-bryant-part-1
- Source: https://www.akitaonrails.com/2007/12/22/chatting-with-avi-bryant-part-2
- Source: http://web.archive.org/web/20130729204305id_/http://itc.conversationsnetwork.org/shows/detail3432.html
- Image source: https://www.flickr.com/photos/x180/505428676
-->

---
# Ruby was a **rediscovery** of Smalltalk

<!--
- [read slide]
-->

---
#### 2007
# Ruby 1.9 (Christmas day)
- YARV interpreter
- "stabby" lambda: f = ->(a,b) { puts a + b }
- Hash colons: { a: 1, b: 2 } vs Hash rockets: { :a => 1, :b => 2 }
- Block-local variables (broke compatibility with Ruby 1.8)

---
#### 2008
![Pharo logo and example from web site](assets/Pharo.png)

<!--
- Pharo
- Forked from Squeak
- Goal: revisit Smalltalk design; enhance it
- Based on OpenSmalltalk Virtual Machine
    - also used by Squeak, Cuis, Newspeak
-->

---
#### 2008
# Rubinius

- Written in Ruby
- Evan Phoenix
- Based loosely on Smalltalk-80 blue book

<!--
- There have been over 30 implementations of Ruby

- Source: https://ruby-compilers.com/
-->

---
#### 2012
# Elixir

<div class="columns">
<div>

- FP
- Ruby-like syntax
    - DSLs
- Erlang VM
- Concurrency
    - Lightweight threads
- Fault tolerance
- Scalability
- Meta-programming

</div><div>

~~~ elixir
def hello(nil), do: IO.puts "Hello, Stranger!"
def hello(name) do
  IO.puts "Hello, " ++ name ++ "!"
end

defmodule User do
  defstruct name: nil, email: nil
end
craig = %User{ name: "Craig", email: "craig@example.com" }
craig = %{ craig | email: "craig@new-address.com" }

defmodule Math do
  def sum([]), do: 0
  def sum([head | tail]), do: head + sum(tail)
end

[1, 2, 3, 4]
    |> Enum.map(&(&1 * 2))
    |> Enum.filter(&(&1 > 4))
    |> Enum.sum()
~~~

</div></div>

<!--
- Lightweight threads
    - 1 million threads on a 16-core machine
- Elixir scales
    - Small embedded devices
    - Large clusters & distributed systems
- Fault tolerance
- https://elixir-lang.org/
-->

---
#### 2013
# TruffleRuby
- Chris Seaton
- Fork of JRuby
- Graal JIT and VM

---
#### 2013
# Ruby 2.0 (and 2.1)

<div class="columns"><div>

- Keyword arguments
- UTF-8
- Refinements (experimental)
- `def` now returns a symbol
- Rational literals

</div><div>

~~~ ruby
def foo(bar: 1)
  bar
end
def foo_old(*options) # Ruby < 2.0, we had to do:
  options[:bar] || 1
end

module M
  refine String do
    def reverse
      "reversed: #{super}"
    end
  end
end
using M
"hello".reverse # prints "reversed: olleh"

def bar(); end == :bar
private def baz(); end

1 // 2 == Rational(1, 2)
~~~

</div></div>

<!--
- Every major release since 2.1 has been yearly, on Christmas day

- Primary source: https://www.ruby-lang.org/en/news/2013/02/24/ruby-2-0-0-p0-is-released/
- Primary source: https://www.ruby-lang.org/en/news/2013/12/25/ruby-2-1-0-is-released/
- Primary source: https://docs.ruby-lang.org/en/2.4.0/syntax/refinements_rdoc.html
-->

---
#### 2014
# Crystal

<div class="columns">
<div>

- Effectively compiled Ruby
- Lose some meta-programming
- Typed, but minimal type hints
- Nil checking
    - No nil errors at runtime!
        - Eliminates class of bugs
- Fast
- Decent community/libraries

</div><div>

~~~ crystal
i = [] of Int32;

def maybe_upcase(name : String?)
  # Compile-time error: 'name' is a 'String?', not a 'String'
  name.upcase
end

module Property
  macro property(name, type)
    def {{name.id}}
      @{{name.id}} : {{type}}
    end
    def {{name.id}}=(value : {{type}})
      @{{name.id}} = value
    end
  end
end

struct User
  extend Property
  property name, String
  property age, Int32?
  def initialize(@name : String, @age : Int32? = nil); end
end
craig = User.new(name: "Craig")
~~~

</div></div>

<!--
- I gave talk on Crystal very early on
    - local Ruby user group - STLRuby
    - had one of the 2 originators on video
- https://crystal-lang.org/
-->

---
#### 2014
# Ruby 2.2
- incremental garbage collector

<!--
- Primary source: https://www.ruby-lang.org/en/news/2014/12/25/ruby-2-2-0-released/
-->

---
#### 2015
# Rust

<div class="columns">
<div>

- Fast and memory-efficient
- Low-level
- Embedded
- Borrow checker
    - Ownership of mutable values
    - Eliminates a class of bugs

</div><div>

~~~ rust
let numbers = vec![1, 2, 3, 4];
let sum: i32 = numbers
    .iter()
    .map(|x| x * 2)
    .filter(|x| x > &4)
    .sum();

fn divide(a: f64, b: f64) -> Result<f64, String> {
    if b == 0.0 { Err("Cannot divide by zero".to_string()) }
    else { Ok(a / b) }
}
match divide(10.0, 0.0) {
    Ok(result) => println!("Result: {}", result),
    Err(err) => println!("Error: {}", err),
}

let mut s = String::from("hello");
let len = calculate_length(&message); // Immutable borrow
let r1 = &mut message; // Mutable borrow
let r2 = &mut message; // Compile error! Can't mutable borrow twice
~~~

</div></div>

<!--
- https://www.rust-lang.org/
-->

---
#### 2015
# Ruby 2.3
- safe navigation operator: `&.` (like Groovy)
- `dig` for nested arrays and hashes

<!--
- Primary source: https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/
-->
<!--
- Primary source: 
-->

---
#### 2015
# Ruby 2.3
- safe navigation operator: `&.` (like Groovy)
- `dig` for nested arrays and hashes

<!--
- Primary source: https://www.ruby-lang.org/en/news/2015/12/25/ruby-2-3-0-released/
-->

---
#### 2016
# Ruby 2.4

<!--
- Primary source: https://www.ruby-lang.org/en/news/2016/12/25/ruby-2-4-0-released/
-->

---
#### 2017
# Ruby 2.5
- rescue and ensure can use a surrounding do-end block

<!--
- Primary source: https://www.ruby-lang.org/en/news/2017/12/25/ruby-2-5-0-released/
-->

---
#### 2018
# Ruby 2.6
- MJIT (experimental)

<!--
- First JIT
- Primary source: https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/
-->

---
#### 2019

~~~ ruby
# Ruby 2.7

people = [
    { name: "Craig", age: 53, children: []},
    { name: "Alice", age: 30, children: [
        { name: "Bob", age: 2 }
    ]}
]

# Pattern matching (experimental)
people.each do |person|
  case person
    in {name: name, children: [{name: child, age: age}]}
      p "#{name} has a #{age}-year-old named #{child}"
    in {name: name, children: []}
      p "#{name} has no children"
  end
end
~~~

<!--
- Primary source: https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released/
-->

---
#### 2020
# Ruby 3.0

<div class="columns"><div>

- 3x3 performance improvements
    - 3 times faster than Ruby 2.0
    - JIT
- Ractors (experimental)
- RBS static analysis
- One-line pattern matching (experimental)
- Endless method definition

</div><div>

~~~ ruby
def raise_to_power(number, power) = number ** power

~~~

</div></div>

<!--
- Primary source: https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/
-->

---
#### 2021
# Ruby 3.1

<div class="columns"><div>

- YJIT (experimental)
- `debug` gem (`rdbg`)
- `error_highlight` gem
- IRB autocomplete
- Pattern matching improvements
    - Pin operator (^)
- TypeProf
</div><div>

~~~ ruby
{x:, y:} == {x: x, y: y}
foo(x:, y:) == foo(x: x, y: y)

Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
~~~

</div></div>

<!--
- Primary source: https://www.ruby-lang.org/en/news/2021/12/25/ruby-3-1-0-released/
-->

---
#### 2022
# Ruby 3.2

<div class="columns"><div>

- Data class
  - immutable value objects
- WebAssembly
- YJIT rewrite
    - C -> Rust
    - no longer experimental

</div><div>

~~~ ruby
class Person < Data.define(:name, :age) do
  def initialize(name:, age:)
    super(name: name.to_s.capitalize, age: age.to_i)
  end
end
craig = Person.new(name: "craig", age: "53")
~~~

</div></div>

<!--
- Data class
    - similar to `Struct`
    - for value objects
    - immutable
        - No setters
        - No "behavior"

- Primary source: https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/
- Source: https://www.shakacode.com/blog/ruby-3-2-adds-a-new-data-class/
-->

---
#### 2023
# Ruby 3.3

- Prism parser
- pure-Ruby JIT compiler (RJIT)
- IRB improvements

<!-- 
- Primary source: https://www.ruby-lang.org/en/news/2023/12/25/ruby-3-3-0-released/
- Primary source: https://railsatscale.com/2023-12-19-irb-for-ruby-3-3/
-->

---
#### 2024
# Ruby 3.4

- Prism parser used by default
- Mutating string literals deprecated
- `it` as block parameter

<!--
- Primary source: https://www.ruby-lang.org/en/news/2024/10/07/ruby-3-4-0-preview2-released/
-->

---
# Newer Ruby Features

- Refinements
- Data classes
- Pattern matching
- Concurrency
- Immutable objects

<!--
- Most of us are not using Ruby to its full potential
    - Not using modern Ruby features
        - I have not used most of these
- QUESTION: Who uses refinements regularly?
- QUESTION: Who is using pattern matching?
- QUESTION: Who is using Data class?
- QUESTION: Who is using concurrency in Ruby?
-->

---
# Ruby's Future

- Ruby will still get new features
    - Innovations
    - Borrowing/stealing
- Ruby will last a long time
- Something will replace Ruby

<!--

- Good solutions are rediscovered
    - We need to look out for other solutions we can learn from
- Compiled languages are winning again
- Many Rubyists have already moved to other languages
    - And communities
        - Community is important
            - Why I keep attending conferences
    - They take what they've learned with them
        - Features
        - Practices
        - Community
        - DX
- Ruby is still alive and doing well
    - Bright future for many years to come
    - It will adapt
- Eventually Ruby use will dwindle
    - Long tail
-->

---
# Take-aways

- Good solutions are rediscovered
- Ruby will last a long time
- Ruby will still get new features
- Something will replace Ruby
- TBD

<!--

- Good solutions are rediscovered
    - We need to look out for other solutions we can learn from
- Compiled languages are winning again
- Many Rubyists have already moved to other languages
    - And communities
        - Community is important
            - Why I keep attending conferences
- Ruby is still alive and doing well
    - Bright future for many years to come
    - It will adapt
- Eventually Ruby use will dwindle
    - Long tail
-->

---

> A change in perspective is worth 80 IQ points.

<cite>Alan Kay</cite>

<!--
- Go learn other languages!
    - It'll make you a better Ruby programmer
-->

---

> Technology is anything invented after you were born.

<cite>Alan Kay</cite>

<!--
- [read quote]
- TODO: Douglas Adams follow-on quote?
- TODO: There was some point I wanted to make here
-->

---

> The best way to predict the future is to invent it.

<cite>Alan Kay</cite>

<!--
- Let's help invent the future!
    - Explore whether decisions made are still valid
    - Experiment with language features
        - Add to Ruby
        - Look at ideas from presentations by TODO: list people
            - Ruby 4.0: To Infinity and Beyond by Bozhidar (BO-ji-dar) Batsov
                - https://www.youtube.com/watch?v=aFSuXUXRySc
            - What If...?: Ruby 3 by Eric Weinstein
                - https://www.youtube.com/watch?v=0i2NgDhXH9Q
            - Compiling Ruby by Kevin Deisz (DICE)
                - https://www.youtube.com/watch?v=iWDOXi7Kj2o
            - Steal This Talk: The Best Features Ruby Doesn't Have (Yet) by John Feminella
                - https://www.youtube.com/watch?v=XrCU5r_NF2Q
        - Steal from other languages
    - Find ways to help the Ruby maintainers
    - Get involved in community for new upcoming language
        - Shape their libraries
        - Shape their tools
- Have fun!
-->

---
# Thank You

* Attendees
* Viewers
* RubyConf organizers
* People that helped me with the talk
    - **Noel Rappin**

---
# Come talk to me!

<div class="columns">
<div>

Ask me about:

- This talk (or others)
- Yoga
- Agile
- Job interviews

</div><div>

Tell me about:

- This talk (or others)
- Principal Engineer jobs
    - https://resume.CraigBuchek.com
- Hexagonal Architecture
- Cool language features

</div></div>

---
# Colophon

- [Marp](https://marp.app/) (https://marp.app/)
- [mise](https://mise.jdx.dev/) (https://mise.jdx.dev/)
- Source: https://github.com/booch/presentations/

---
# Contact Info

- GitHub: [booch](https://github.com/booch), [boochtek](https://github.com/boochtek)
- Email: first.last@Gmail.com
- LinkedIn https://linkedin.com/in/craigbuchek
- Web page: https://CraigBuchek.com
- Everywhere else: CraigBuchek
    - Mastodon @ruby.social
    - Twitter
