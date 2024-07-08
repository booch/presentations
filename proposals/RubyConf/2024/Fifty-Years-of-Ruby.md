# Fifty Years of Ruby

NOTE: This is an update to a RailsConf 2022 proposal.

## Title

* POSSIBLE TITLE: Ruby: Smalltalk, Rediscovered
* Possible reframe: 50 Years of Smalltalk

## Description (seen by attendees)

Our modern-day concepts of GUIs, WYSIWYG, and IDEs were developed at Xerox PARC in the early 1970s. Alan Kay was one of the first employees, working on programming languages, among other things. He first released Smalltalk in 1972.

While Ruby was not directly derived from Smalltalk, the two are surprisingly similar. We'll explore the history of Smalltalk, and the context in which it was formed. We'll see how Ruby rediscovered and reapplied Smalltalk's concepts, with an eye towards understanding Ruby's future.

## Notes for reviewers

I've been thinking about this talk for a few years. It's one of my favorite proposals that has not yet been selected. My current conception is a history lesson in the "Nick Means style" — a story of the players and the context around them — with lots of pictures, some video, and not much code. I am no Nicholas Means; I merely aspire to give a presentation in a style similar to the way he tells a story.

This is definitely a "how did we get here" talk. It builds on [25 Years of Smalltalk](https://web.archive.org/web/20130612055149/http://www.mojowire.com/TravelsWithSmalltalk/DaveThomas-TravelsWithSmalltalk.htm) and the premise of Avi Bryant's talk at RailsConf 2007 — namely that Ruby is in many ways a dialect of Smalltalk. I'll reference both of those quite a bit.

I'm hoping to help attendees get a better understanding of where OOP came from, in order to have a better understanding of OOP itself, and how it fits in with other programming paradigms.

I think the Ruby community should be more thoughtful about the path forward, as Ruby matures. I'm quite certain that there are lessons from Smalltalk (and other sources) that we would be wise to learn, understand, and apply.

Current outline of what I plan to cover:

* The context in which Smalltalk was designed
    - Engelbart's "Mother of All Demos"
    - Alan Kay
    - The environment created at Xerox PARC
        - IDEs, GUIs, and WYSIWYG originate from ostensibly the same team
        - MVC pattern (and how web MVC is different from GUI MVC)
* Smalltalk's history
    - Code samples from Smalltalk-72, -76, -80
    - Why Smalltalk "lost" to C++
* OOP
    - Where did the idea come from?
    - What influences played a role?
    - What are the key ideas?
* Smalltalk today
* Ruby's history
* Ruby was a **rediscovery** of Smalltalk
    - Both took the idea "everything is an object" to its logical conclusion
    - Both are very dynamically-bound, allowing easy meta-programming
* Ruby's influences
    - Surprisingly, Smalltalk was not a very big influence
* Similarities and differences between Ruby and Smalltalk
    - Blocks
    - Both treat collections as functional constructs
* The future of Ruby
    - As deduced from looking at where Smalltalk is now
    - As deduced from Ruby's trajectory
    - As deduced from the influence of other modern languages
* Good solutions are rediscovered
    - We need to look out for other solutions we can learn from

## My Notes

* Smalltalk project was started in 1969
* Smalltalk was released in 1972
* Smalltalk was released publicly in 1980

* Talk about Alan Kay
* Get into Simula a bit
* Smalltalk-72 apparently had a much different syntax than Smalltalk-76 and -80
* Pull ideas from (and reference) Avi Bryant's keynote from RailsConf 2007
    * Check the date
* MVC pattern (and how web MVC is different from GUI MVC)
