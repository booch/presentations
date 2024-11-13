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
make setup
~~~

## Build

To build the HTML page, and have it auto-update as you make changes:

~~~ shell
make dev
~~~

To build the HTML page for later use:

~~~ shell
make
~~~

To create a PDF:

~~~ shell
make pdf
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
    - Show Perl ✅
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
- Tie in other languages ✅
- Slot back in what Ruby took from languages ✅
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
2. Matz's innovations
    - focus on developer happiness❗❗❗❗
    - simple, easy to read syntax
        - well-done blocks!
        - dot notation for method calls
        - no type annotations
    - Duck typing❗
    - OOP at the right time
        - But also FP (primarily for collections)
        - easy to learn because of syntax and duck typing
        - fast feedback loop, because it's interpreted
    - good meta-programming story❗
    - good syntax for DSLs❗
    - community?❗
        - MINASWAN: Matz is nice, and so we are nice
3. Why Smalltalk "lost" to C++❗
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
4. Ruby's growth ✅
    - Features added (innovations, borrowed)
    - Milestones
5. Language support for Faux-O ???
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
6. Compile-time execution will continue to gain popularity
    - Today: you tell it what should run at compile time
    - Future: let the compiler run whatever it thinks is best
7.  Smalltalk is still used today
    - Heyday was the late 1999s
    - Many of the people moved to Ruby
8.  Short URL ✅
9.  Make Headings stay at the top of the page consistently ✅
10. Fix colors in header/footers ✅
11. Slide: XR, new Meta concept, Apple XR, Oculus, etc❗❗❗❗❗❗
12. Collection methods:
    - collect (map), select (filter), inject (reduce), reject, detect
13. Add "RubyConf 2024" to title page ✅
14. Make quotes look nicer ✅
15. Create a thumbnail of the presentation ✅
16. Makefile ✅

## Colophon

I'm using [Marp](https://marp.app) to build my slides.
This is the first time I'm using it; I used [Remark](https://remarkjs.com) for the past several years.

## Sources

- https://blog.jetbrains.com/ruby/2015/12/20-years-of-ruby/ ***
- http://blog.nicksieger.com/articles/2006/10/20/rubyconf-history-of-ruby/
- https://web.archive.org/web/20150506152932/http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
- https://web.archive.org/web/20110716133016/http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/382
- https://en.wikipedia.org/wiki/History_of_Ruby


## Practice w/ Kerri
- 38 minutes
    - Start: 6:07
    - End: 6:45
- TODO: Tighten things up
- Smalltalk's first version in a week ✅
- Cut out GUI page ✅
- +Perl code ✅
- IDEA: Photos of what happened those years!
- Birthday cake ✅
- Ruby 1.0 ✅
    - Announcement?
        - Can't find a trace of it on the web
    - First of many major releases on Christmas day ✅
    - Christmas background! ✅
- 1.8 ✅
    - Maturity! ✅
        - background pic representing maturity?
- Rails ✅
    - Huge growth of community ✅
    - Ruby's killer app ✅
- 1.9 ✅
    - Code examples ✅
    - Compatibility - move to notes ✅
    - Nightmare getting gems to work with each other ✅
        - Provoked Bundler ✅
- Elixir: José Valim ✅
    - wrote books on Ruby ✅
- 2.2
    - Pic of trash can?
    - Performance improvements ✅
- 2.3 ✅
    - Move Groovy to notes ✅
    - Performance improvements ✅
- 2.4 ✅
    - Performance improvements ✅
    - Unify Fixnum and Bignum into Integer ✅
- 2.5
    - a couple more notes and/or bullets?
- 2.6
    - Bundler included ✅
    - endless ranges 
    - `then` ✅
    - function composition operators << and >> ✅
- 2.7
    - notes ✅
    - bullets, maybe
    - Make the title a title ✅
- 3.0
    - more notes ✅
    - more code ✅
- 3.1
    - bullet and note about `x: x` shortcut ✅
- 3.3 show Prism code usage - NO!
- 3.4 show code using `it` ✅
    - Earlier version using `_1`, `_2`, etc ✅
- remove "technology" quote? ✅
- Show names of 3 talks I recommend about Ruby's future ✅
    - QR codes?
- Remove Colophon ✅
- Cut Netlab ✅
- **Rediscovery slide**: more notes ✅
- Why did C++ win? !!!!!!!
    - UNIX ecosystem
    - File-based
    - Worse is better
    - Smalltalk was quietly being used in industry
        - Airline industry
        - IBM VisualAge
        - Original XP team
    - Smalltalk community became Ruby community
    - Ruby values quality over quantity
    - Same number of conferences
- Rust etc
    - Language logos ✅
- Names on pictures of people
    - low priority
- Crop Chad picture ✅
- DHH/Rails pics: center ✅
- Fix page number on DHH slide


## Practice night before:

- Start: 10:42
- Finish: 11:18

18+18=36 minutes


8:35 - 9:02 = 27 minutes


## Last-minute TODOs

- Kill 2.5 ✅
- Rust etc
    - Language logos ✅
- TODO?: Why did C++ win? !!!!!!!
    - UNIX ecosystem
    - File-based
    - Worse is better
    - Smalltalk was quietly being used in industry
        - Airline industry
        - IBM VisualAge
        - Original XP team
    - Smalltalk community became Ruby community
    - Same number of conferences
2. Matz's innovations
    - focus on developer happiness❗❗❗❗
    - simple, easy to read syntax
        - well-done blocks!
        - dot notation for method calls
        - no type annotations
    - Duck typing❗
    - OOP at the right time
        - But also FP (primarily for collections)
        - easy to learn because of syntax and duck typing
        - fast feedback loop, because it's interpreted
    - good meta-programming story❗
    - good syntax for DSLs❗
    - community?❗
        - MINASWAN: Matz is nice, and so we are nice
3. Why Smalltalk "lost" to C++❗
    - Ruby values quality over quantity
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
