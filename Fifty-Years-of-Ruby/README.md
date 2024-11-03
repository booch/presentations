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

## TODO

1. Questions for dry-run
    - Should I just put everything in chronological order?
    - Should I put the RubyConf graphic on most slides?
    - Note these TODOs
    - Suggestions for better transitions
    - Suggestions for better pictures
    - Should I include full dates, or just years?
2. Language support for Faux-O
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
3. Compile-time execution will continue to gain popularity
    - Today: you tell it what should run at compile time
    - Future: let the compiler run whatever it thinks is best
4. Slide: XR, new Meta concept, Apple XR, Oculus, etc
5. Make Headings stay at the top of the page consistently
6. Fix colors in header/footers
7. Add "RubyConf 2024" to title page
8. Make quotes look nicer
9.  Add a header with the date?
    - or the title
    - or RubyConf 2024
10. Create a thumbnail of the presentation
    - `marp --image=png slides.md -o og-image.png`
    - generate slide-show with `--og-image=og-image.png`
    - or add `image: og-image.png` to marp.yml
11. Makefile?
