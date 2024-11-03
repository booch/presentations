---
title: 'Fifty Years of Ruby'
author: 'Craig Buchek'
description: 'The history, present, and future of the Ruby programming language'
marp: true
paginate: true
header: 'https://craigbuchek.com/fifty' # Left header
footer: '@CraigBuchek' # Left footer
# backgroundImage: 'linear-gradient(to bottom, #67b8e3, #0288d1)'
url: https://craigbuchek.com/fifty
---
<!-- _class: title lead -->
<!-- _paginate: false # Hide page number on title page. -->
![bg](assets/RubyConf-2024-background-title.png)

## Craig Buchek

# Fifty Years of Ruby

<!-- 
- Hi, I'm Craig!
- If you want to "at" me, ...
    - I'm on Twitter and Mastodon via ruby.social
        - ... infrequently
- Short URL for the slides in lower right
    - Follow along, or look at them later
    - Hit `P` to toggle presenter notes
        - Also links to resources
        - ... and some details that I don't have time to cover
-->

---

> The best way to predict the future is to invent it.

<cite>Alan Kay</cite>

<!-- 
- Today, I'm going to talk about:
    - ideas that have led to us being here today
    - people who had a vision of future
    - how they shaped computers we use today
    - how they shaped Ruby
    - what Ruby's future might look like
-->

---
<!-- _backgroundColor: black -->
# 1995: Ruby

![RubyConf 2024 doodle](assets/RubyConf-2024-background-doodle-2.png)
![bg 60%](assets/Yukihiro-Matsumoto-2011.jpg)

<!--
- December 21, 1995
    - Ruby's first release: 0.95
    - Started from conversation with a colleague on February 24, 1993
- Yukihiro Matsumoto
    - "Matz"
- Influenced by:
    - Perl, Smalltalk, Eiffel, Ada, Lisp
    - "more powerful than Perl, and more object-oriented than Python"
- "Ruby is a language designed in the following steps":
    - take a simple lisp language (like one prior to CL).
    - remove macros, s-expression.
    - add simple object system (much simpler than CLOS).
    - add blocks, inspired by higher order functions.
    - add methods found in Smalltalk.
    - add functionality found in Perl (in OO way).
- I will dig into the most similar of those languages, Smalltalk
- Image credit: https://upload.wikimedia.org/wikipedia/commons/5/5a/Yukihiro_Matsumoto_EuRuKo_2011.jpg
-->

---
# 1968: Mother of All Demos
![bg](assets/mother-of-all-demos-keyboard.jpg)

<!-- 
- 1968: Mother of All Demos
    - December 9, 1968
    - ACM conference in San Francisco
    - Matz was 3 years old
- Who: Douglas Engelbart
    - Augmentation Research Center
        - Stanford Research Institute
            - Stanford University
        - ARPA funding
- What: NLS: Online System
- Innovations:
    - Mouse
        - Actually invented at ARC in 1963
    - Personal computing
    - Real-time video conferencing
    - Interactive editing
- Steven Levy dubbed it "the mother of all demos" in 1994
    - _Insanely Great_
- TODO: Better images
- TODO: Link to "Augmenting Human Intellect: A Conceptual Framework" (1962)
-->

---
# 1942: As We May Think

<!-- 
- 1945: As We May Think
    - _The Atlantic_ magazine, July 1945
    - Engelbart read it in 1945 and again in 1961
        - Inspired him to design a sort of memex!
        - Wrote "A Conceptual Framework for the Augmentation of Man's Intellect"
            - 1963
- Vannevar Bush
    - Engineer
        - Analog computers
            - Differential equation solvers
    - MIT
        - PhD
        - Dean of Engineering
    - Lots of government science agencies
        - Head of NACA (NASA's predecessor)
        - Organization overseeing Manhattan Project
            - Was in the 2023 Oppenheimer movie
    - Founded Raytheon
- memex (memory expansion)
    - store all of your books, records, and communications
    - desk with microfilm screens
    - supplement memory
    - shared and collective memories
    - associative indexing "trails" of research
- Innovative ideas
    - hypertext
    - personal computers
    - Internet/Web
    - speech recognition
    - online encyclopedias
    - information science/processing/work/society/literacy
    - information overload
- Ted Nelson referred to it when he conceived "hypertext" in 1960
- Primary sources:
    - https://www.theatlantic.com/magazine/archive/1945/07/as-we-may-think/303881/
        - paywalled
    - https://cdn.theatlantic.com/media/archives/1945/07/176-1/132407932.pdf
    - https://www.w3.org/History/1945/vbush/vbush.shtml
    - Abridged version in _Life_ magazine, September 10, 1945
        - https://worrydream.com/refs/Bush_1945_-_As_We_May_Think_(Life_Magazine).pdf
        - Adds some drawings
    - https://dougengelbart.org/pubs/augment-133183-AHI-Vistas.html
-->

---

> Wholly new forms of encyclopedias will appear, 
> ready-made with a mesh of associative trails running through them,
> ready to be dropped into the memex and there amplified.

<cite>Vannevar Bush, _As We May Think_</cite>

<!--

-->

---
# Alan Kay
![bg left](assets/Alan_Kay_(3097597186)_(cropped).jpg)

<!--
- Attended MoAD
- Degree in Molecular Biology
- Where
    - Stanford Artificial Intelligence Lab (1969)
    - Xerox PARC (1970-1981)
    - Atari (1981-1984)
    - Apple (1984-1996)
    - Disney (1997-2002)
- Squeak (1995)
- GUI
- OOP
- Dynabook (1972)
    - OLPC: One laptop per child (2005)
    - Key to everything: GUI, UX, OOP
- https://tinlizzie.org/IA/index.php/Talks_by_Alan_Kay
- https://www.quora.com/profile/Alan-Kay-11
- Photo credit: https://commons.wikimedia.org/wiki/File:Alan_Kay_(3097597186)_(cropped).jpg
-->

---
# 1973: Xerox PARC

<!-- 
- Xerox Palo Alto Research Center
- Lots of people from SRI's Augmentation Research Center
- Innovations:
    - Laser printer
    - GUI, icons
    - Ethernet
    - Real-time video conferencing
    - Interactive editing
- Xerox Alto
    - Introduced March 1, 1973
    - $32k ($100k+ today)
    - 96kB RAM
        - $4k more for 128kB
        - up to 512kB
    - 2.5 MB removable hard drive
    - About 2000 made
        - Mostly used at Xerox and universities
    - Byte magazine in 1981:
        "It is unlikely that a person outside of the computer-science research community will ever be able to buy an Alto. They are not intended for commercial sale, but rather as development tools for Xerox, and so will not be mass-produced. What makes them worthy of mention is the fact that a large number of the personal computers of tomorrow will be designed with knowledge gained from the development of the Alto."
    - Keyboard, mouse (3 buttons), key chorder (5 keys)
    - Size of a small refrigerator
    - Ethernet
- Steve Jobs and Apple folks visited in 1979 (twice)
    - Xerox received some Apple stock options
    - Inspired the Mac
    - Smalltalk-76, networking, mouse-driven WYSIWYG GUI
    - "Xerox could have owned the entire computer industry, could have been the IBM of the nineties, could have been the Microsoft of the nineties." -- Steve Jobs
- Niklaus Wirth had sabbaticals there in 1976-1977 and 1985
    - Inspired him to build DISER Lilith (1980)
    - Inspired him to create Oberon programming language
- Xerox Star in 1981
    - $16k ($50k+ today)
    - Same year as IBM PC ($2k)
    - Sold commercially
- Also inspired SUN workstations
    - Stanford University Network
- https://en.wikipedia.org/wiki/PARC_(company)
- https://en.wikipedia.org/wiki/List_of_people_associated_with_PARC
- PARC campus photo credit: https://preview.redd.it/kjl8la0xow191.jpg?width=900&format=pjpg&auto=webp&s=bc4dfbff6ada4007fdf27ed9fed8dcdbee6ed12e
- Xerox Alto photo credit: https://dq51jve9h21d4.cloudfront.net/sites/default/files/imce/xie-alto-1-886x750.jpg.pagespeed.ic.pU09ByiUIQ.webp
-->

---
# Smalltalk

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
- Source: https://smalltalkzoo.thechm.org/papers/EvolutionOfSmalltalk.pdf
-->

---
# Smalltalk-76

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
![bg left w:80%](assets/Smalltalk-80-book.jpg)
# Smalltalk-80

<!--
- First Smalltalk book
- Adele Goldberg
    - Xerox PARC
    - One of the designers/implementers of Smalltalk
-->

---
# OOP

TODO: picture

<!--
- Alan Kay coined the term "object-oriented programming" in 1967
- "objects" that encapsulate data and behavior
    - interacting with each other through messages
- He'd been working on the ideas since 1966
- He regrets the term
    - Should have been "message-oriented programming"
    - "I'm sorry that I long ago coined the term "objects" for this topic because it gets many people to focus on the lesser idea. The big idea is "messaging"."
        - https://lists.squeakfoundation.org/pipermail/squeak-dev/1998-October/017019.html
    - "OOP to me means only messaging, local retention and protection and hiding of state-process, and extreme late-binding of all things."
- Regrets that Smalltalk did not evolve after Smalltalk-80
- Smalltalk was 1st OOP language
    - or so I thought ...
-->

---
# Simula 67

~~~ simula-67
Class Rectangle (Width, Height); Real Width, Height;
                         ! Class with two parameters;
   Begin
      Real Area, Perimeter;  ! Attributes;

      Procedure Update;     ! Methods (Can be Virtual);
      Begin
         Area := Width * Height;
         Perimeter := 2*(Width + Height)
      End of Update;

      Boolean Procedure IsSquare;
         IsSquare := Width=Height;
      Update;               ! Life of rectangle started at creation;
    OutText("Rectangle created: "); OutFix(Width,2,6);
    OutFix(Height,2,6); OutImage
End of Rectangle;
~~~

<!--
- Or perhaps Simula 67 was the first OO language
    - Derived from ALGOL 60
        - Most languages we use today are ancestors of ALGOL 60
- "more" syntax than we see today
- but you can make everything out
    - types
    - instance variables
    - class keyword for user-defined types
    - methods
    - ...
- code source: https://staff.um.edu.mt/jskl1/talk.html
-->

---
# Simula 67

~~~ simula-67
Rectangle Class LocRectangle (X, Y); Integer X, Y;
Begin                                        ! More parameters;
   Boolean Tall;                             ! More attributes;
   Procedure Move (Dx, Dy); Integer Dx, Dy;  ! More methods;
   Begin
      X := X + Dx; Y := Y + Dy
   End of Move;
   Tall := Height > Width;
   OutText("Located at: "); OutFix(X,2,6); OutFix(Y,2,6); OutImage
End of LocRectangle;
~~~

<!--
- but you can make everything out
    - ... subclass inheriting from superclass
        - and adding more instance variables
- Simula 67
    - garbage collection
    - objects were processes
        - actor model
        - coroutines
            - no true parallelism
- code source: https://staff.um.edu.mt/jskl1/talk.html
-->

---
# 1995: Celebrating 25 Years of Smalltalk

<!--
- Dave Thomas
    - Object Technology International
    - Created IBM VisualAge
    - Eclipse IDE
    - Object Mentor
        - Agile training
    - TODO: What did this talk have to say? What can we learn from it?
-->

---
![bg left w:80%](assets/Smalltalk-Best-Practice-Patterns.jpg)
# Smalltalk Best Practice Patterns

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
# Pickaxe Book
![bg left w:80%](assets/Programming-Ruby-1st-ed.jpg)

<!--
- December 15, 2000
- First English-language book on Ruby
- Dave Thomas (Pragmatic Dave)
    - Pragmatic Programmer book
        - Coined "DRY"
    - Pragmatic Bookshelf
    - Agile manifesto
-->

---
# 2004: Ruby on Rails
![bg left](assets/dhh-headshot-2017-full.jpg)

<!--
- David Heinemeier Hansson
    - Danish programmer
- Released Rails in 2004 # TODO: get exact date?
    - part of framework he built for Basecamp at 37 Signals
- Made enough money to buy himself a bespoke exotic race car
    - His Wikipedia entry has much more detail on his racing career than Rails
- image credit: https://dhh.dk/images/headshot-2017-full.jpg
-->

---
# 2005: Agile Web Development with Rails
![bg left top:0](assets/Agile-Web-Development-with-Rails-1st-ed.jpg)

<!--
- Dave Thomas (Pragmatic Dave)
    - with DHH
- August 7, 2005
- TODO: More about this book
-->

---
# 2007: Avi Bryant at RailsConf
![bg](assets/Avi-Bryant-keynote-RailsConf-2007.png)

- TODO: Crop off the bottom of the image, so we can see the top of the picture
- TODO: Story about this talk

<!--
- TODO: Story about this talk
-->

---
# Ruby was a **rediscovery** of Smalltalk

<!--
- [read slide]
-->

---
# FP

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
# Squeak

- Modern Smalltalk
- Others:
    - Pharo
    - Newspeak
    - Cuis
- OpenSmalltalk Virtual Machine

---
<div class="columns">
<div>

# Crystal

- Effectively compiled Ruby
- Plus type hints
- Nil checking
    - No nil errors at runtime!
        - Eliminates a whole class of bugs
- Fast
- Lose some meta-programming
- Decent community/libraries

</div><div>

~~~ crystal
x = [] of Int32;

# TODO: show nil checking?
# TODO: show meta-programming?
~~~

</div></div>

<!--
- I gave talk on Crystal very early on
    - local Ruby user group - STLRuby
    - had one of the 2 originators on video
- https://crystal-lang.org/
-->

---
# Elixir

- FP
- Ruby-like syntax
    - DSLs
- Erlang VM
- Concurrency
    - Lightweight threads
- Fault tolerance
- Scalability
- Meta-programming

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
# Rust

- Fast and memory-efficient
- Low-level
- Embedded
- Borrow checker
    - Ownership of mutable values
    - Eliminates a whole class of bugs

<!--
- https://www.rust-lang.org/
-->

---
# Zig

- Low-level
    - Like C, but better
- No hidden control flow
- No hidden memory allocations
- No macros
- Call any function at compile-time

<!--
- https://ziglang.org/
-->

---
# Nim

- Compiled
    - C-like performance
    - Compile-time execution
- Macros
- Garbage collection
- Python-like syntax

<!--
- https://nim-lang.org/
-->

---
# Other

- Roc
    - Descendent of Elm
    - No Null, use Result types
    - Type inference; no type annotations
- Gleam
    - Runs on Erlang VM
    - No null
    - No implicit conversions
    - No exceptions

<!--
https://www.roc-lang.org/
https://www.gleam.run/
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
    - Noel Rappin
    - Kerri Miller
    - Mikhail Pasichniuk

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
