# Fifty Years of Ruby

This is a talk that I've been thinking about for many years.
I'll be presenting it ar RubyConf 2024 in Chicago.

I'm using [Marp](https://marp.app) to build my slides.
This is the first time I'm using it; I used [Remark](https://remarkjs.com) for the past several years.

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
    - Timeline at the top or bottom
- EngelBART
- Wait to introduce myself during the first quote
- Dave Thomas might be in the room?!?!?!?!?!
- Matz may be in the room!?!?!?!?!
- less about Dynabook
    - keep everything tied to Smalltalk and Ruby
- Alto team
    - Felt guilty having spare computer cycles overnight
- $32k in 1973 is now $200k ✅
- More fun with constraints
    - RAM
    - GUI
- Define more terms
- Assume less knowledge about Lisp, etc
    - Show lisp code?
    - Show Perl?
        - Camel book picture
- Transition slides
- Drop Vannevar Bush? ✅
- Describe what is happening at MoAD
    - Talk more about key chorder
- Gap between 1980 and 1997
    - Smalltalk was a viable language in the 1990s
    - "Escaped from the lab"
    - Airline industry ran on Smalltalk for a long time
    - Original XP C3 team was in Smalltalk
    - IBM VisualAge Smalltalk
    - Supplanted when Linux made UNIX cheap
- Rediscovery, reinvention, interpretation by Ruby
- Why did C++ win?
    - File-based
    - UNIX ecosystem
- Squeak started at Apple
    - Smalltalk-to-C generator
    - Build a bootstrapping kernel
        - Easy to port to new platforms
    - When moved to Disney, forked the Open Source project
- Pharo is more popular than Squeak
- More about Avi
- Tie in other languages
- Slot back in what Ruby took from languages
    - What Matz innovated
- Drop a few newer languages ✅
- Only inspired by Ruby - Elixir, Rust, Crystal ✅
- How Ruby fits in to history of personal computers
- New Ruby features
    - What is the context
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
3. Language support for Faux-O
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
4. Why Smalltalk "lost" to C++
    - Ask Alan Kay on Quora
    - Worse is better
        - Smalltalk ecosystem made it too difficult to share code
            - The image
        - Wanted everything to be inside Smalltalk
            - Hard to talk to DBs
      - C++ fit into the UNIX ecosystem
5. Key ideas of OOP
    - Message passing
    - Encapsulation
    - Polymorphism
    - picture of cells "communicating"
6. Story about Ruby community learning
    - Meta-programming overuse
        - I did it myself (after deferring learning about it for a while)\
        - I see most programmers do this
        - As Noel Rappin says, you don't fully understand the boundaries of your tools until you overuse them
7. Compile-time execution will continue to gain popularity
    - Today: you tell it what should run at compile time
    - Future: let the compiler run whatever it thinks is best
8. Slide: XR, new Meta concept, Apple XR, Oculus, etc
9.  Smalltalk is still used today
    - Heyday was the late 1999s
    - Many of the people moved to Ruby
10. WYSIWYG
11. Make Headings stay at the top of the page consistently
12. Fix colors in header/footers
13. Add "RubyConf 2024" to title page
14. Make quotes look nicer
16. Add a header with the date?
    - or the title
    - or RubyConf 2024
17. Create a thumbnail of the presentation
    - `marp --image=png slides.md -o og-image.png`
    - generate slide-show with `--og-image=og-image.png`
    - or add `image: og-image.png` to marp.yml
18. Makefile?
