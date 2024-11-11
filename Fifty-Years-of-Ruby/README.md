# Fifty Years of Ruby

This is a talk that I've been thinking about for many years.
I'll be presenting it at [RubyConf 2024](https://rubyconf.org/) in Chicago
on November 13.

The short URL for the presentation is https://craigbuchek.com/fifty.
That should take you to https://booch.github.io/presentations/Fifty-Years-of-Ruby/slides.html.

Here's [the proposal](https://github.com/booch/presentations/blob/master/proposals/RubyConf/2024/Fifty-Years-of-Ruby.md) for this talk.

## Abstract

Our modern-day concepts of GUIs, WYSIWYG, and IDEs were developed at Xerox PARC in the early 1970s. Alan Kay was one of the first employees, working on programming languages, among other things. He first released Smalltalk in 1972.

While Ruby was not directly derived from Smalltalk, the two are surprisingly similar. We'll explore the history of Smalltalk, and the context in which it was formed. We'll see how Ruby rediscovered and reapplied Smalltalk's concepts, with an eye towards understanding Ruby's future.

## Setup

I'm using [mise](https://mise.jdx.dev) now, to install the correct versions of the tools I use.
Unfortunately, the binaries that the Marp project supplies on GitHub no longer support MacOS on x86-64.
These are the same binaries that the mise marp-cli plugin uses.
So I'm currently using Homebrew to install Marp.

~~~ shell
mise -y install
brew install --quiet marp-cli
brew upgrade --quiet marp-cli
~~~

## Build

To build the HTML page, and have it auto-update as you make changes:

~~~ shell
marp --config=marp.yml --watch --browser=firefox slides.md -o slides.html
~~~

To build the HTML page for later use:

~~~ shell
marp --config=marp.yml slides.md -o slides.html
~~~

To create a PDF:

~~~ shell
marp --config=marp.yml --pdf --preview slides.md -o slides.pdf
~~~


## Feedback

- elevator pitch
    - what is the point?
        - Ruby influences and influenced-bys
    - tie it all back to Ruby better
- Chronological order ✅
    - Timeline at the top or bottom ✅
- EngelBART ✅
- Wait to introduce myself during the first quote ✅
- Dave Thomas might be in the room?!?!?!?!?!
- Matz may be in the room!?!?!?!?!
- less about Dynabook
    - keep everything tied to Smalltalk and Ruby
- $32k in 1973 is now $200k ✅
- More fun with constraints
    - RAM
    - GUI
- Define more terms❗
- Assume less knowledge about Lisp, etc
    - Show lisp code❗
    - Show Perl❗
        - Camel book picture ✅
- Transition slides❗
- Drop Vannevar Bush? ✅
- Describe what is happening at MoAD ✅
    - Talk more about key chorder ✅
- Gap between 1980 and 1997❗
    - Smalltalk was a viable language in the 1990s
    - "Escaped from the lab"
    - Airline industry ran on Smalltalk for a long time
    - Original XP C3 team was in Smalltalk
    - IBM VisualAge Smalltalk
    - Supplanted when Linux made UNIX cheap
- Rediscovery, reinvention, interpretation by Ruby
- Why did C++ win?❗
    - File-based
    - UNIX ecosystem
- Squeak started at Apple ✅
    - Smalltalk-to-C generator ✅
- Pharo is more popular than Squeak ✅
- More about Avi's talk❗
    - "The Dream of Smalltalk is Alive in Ruby"
    - My realizations:
        - Ruby **is** a Smalltalk
        - Smalltalk community **became** the Ruby community
- Tie in other languages
- Slot back in what Ruby took from languages
    - And what Matz innovated
- Drop a few newer languages ✅
- Only inspired by Ruby - Elixir, Rust, Crystal ✅
- How Ruby fits into history of personal computers
- New Ruby features
    - What is the context❗
        - Borrowing
        - Innovating
        - Other languages borrowing from Ruby

## TODO

1. Questions for dry-run
    - Should I just put everything in chronological order?
    - Should I put the RubyConf graphic on most slides?
    - Note the TODOs below
    - Suggestions for better transitions
    - Suggestions for better pictures
    - Should I include full dates, or just years?
    - Too much?
    - Too little?
2. Ruby's growth
    - Features added (innovations, borrowed)
    - Milestones
3. Language support for Faux-O ???
    - Boundaries talk
    - Bob Martin said that the only thing that has changed in the last 50 years has been adding constraints
        - Structured programming constrains use of GOTO
        - Object-oriented programming constrains use of global variables
        - Functional programming constrains use of assignment
        - Declarative programming constrains use of control structures
    - I think a language that gives us Faux-O constraints is next
        - Why not both OO and FP support in a language?
            - Ruby, Smalltalk, and JavaScript do this fairly well
        - I believe we need immutable objects that are around passed to functions
            - Manipulate them with function calls, rather than message passing
            - But the syntax looks the same as OO
            - They can **represent** a state instead of **having** a state
        - Message-passing actors for the procedural shell
4. Why Smalltalk "lost" to C++❗
    - File-based vs "the image"
    - UNIX ecosystem
    - Ask Alan Kay on Quora?
    - Worse is better
        - Smalltalk ecosystem made it too difficult to share code
            - The image
        - Wanted everything to be inside Smalltalk
            - Hard to talk to DBs
        - C++ fit into the UNIX ecosystem
    - My theory: It didn't!❗❗❗
        - Smalltalk community _mostly_ **became** the Ruby community
            - Many of the Agile Manifesto signers were Smalltalkers who became Rubyists
                - Kent Beck, Ward Cunningham, Ron Jeffries, Dave Thomas, Robert Martin, Martin Fowler, etc
        - C++ had ~20 conferences in 2019
            - https://isocpp.org/wiki/faq/conferences-worldwide
        - Ruby had ~20 conferences in 2019
            - https://rubyconferences.org/past/
6. Story about Ruby community learning NO
    - Meta-programming overuse
        - I did it myself (after deferring learning about it for a while)\
        - I see most programmers do this
        - As Noel Rappin says, you don't fully understand the boundaries of your tools until you overuse them
7. Compile-time execution will continue to gain popularity
    - Today: you tell it what should run at compile time
    - Future: let the compiler run whatever it thinks is best
8. Slide: XR, new Meta concept, Apple XR, Oculus, etc
9. Collection methods: collect (map), select (filter), inject (reduce), reject, detect❗
10. Smalltalk is still used today
    - Heyday was the late 1999s
    - Many of the people moved to Ruby
11. Short URL ✅
12. Make Headings stay at the top of the page consistently ✅
13. Fix colors in header/footers ✅
14. Matz's innovations
    - focus on developer happiness❗
    - simple, easy to read syntax
        - well-done blocks!
        - dot notation for method calls
        - no type annotations
    - Duck typing❗
    - attr_accessor?
    - OOP at the right time
        - But also FP (primarily for collections)
        - easy to learn because of syntax and duck typing
        - fast feedback loop, because it's interpreted
    - good for DSLs❗
    - good meta-programming story❗
    - community?❗
15. Mistakes in Ruby (see Ruby, the Bad Parts) NO
    - Monkey patching
    - Global variables
    - Flip-flop operator?
    - and/or/not keywords
        - lower precedence, leading to confusion
    - BEGIN/END blocks
16. Add "RubyConf 2024" to title page ✅
17. Make quotes look nicer ✅
18. Create a thumbnail of the presentation
    - `marp --image=png slides.md -o og-image.png`
    - generate slide-show with `--og-image=og-image.png`
    - or add `image: og-image.png` to marp.yml
19. Makefile?

## Colophon

I'm using [Marp](https://marp.app) to build my slides.
This is the first time I'm using it; I used [Remark](https://remarkjs.com) for the past several years.

## Sources

- https://blog.jetbrains.com/ruby/2015/12/20-years-of-ruby/
- http://blog.nicksieger.com/articles/2006/10/20/rubyconf-history-of-ruby/
- https://web.archive.org/web/20150506152932/http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
- https://web.archive.org/web/20110716133016/http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/382
- https://en.wikipedia.org/wiki/History_of_Ruby



## Practice w/ Kerri
- 38 minutes
    - Start: 6:07
    - End: 6:45
