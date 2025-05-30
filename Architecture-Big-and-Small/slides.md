layout: true

<header>
  <p class="left">Madison Ruby+ 2024</p>
  <p class="right">@CraigBuchek</p>
</header>

<footer>
  <p class="left"><!-- page numbers --></p>
  <p class="right">http://craigbuchek.com/arch</p>
</footer>

---
class: title, middle, center

# Architecture

# Big and Small

???

- Hi, I'm Craig
    - Today, I'm going to talk about "architecture", "design", and "patterns"
- If you want to "at" me, ...
    - I'm on Twitter and Mastodon via ruby.social
        - ... infrequently
- I have a short URL for the slides in the lower right.
    - Follow along, or look at them later
    - Hit `P` to toggle presenter notes
        - Also links to resources
        - ... and some details that I don't have time to cover

------

- My wife Beth has a degree in Interior Design/Architecture
    - This topic is at the intersection of our interests

---
class: single-image

![book cover - Design Patterns](images/Design-Patterns-book.webp)

???

- AUDIENCE QUESTION: Who is familiar with this book?

---
class: single-image

![cover - Design Patterns CD](images/Design-Patterns-CD.jpg)

???

- AUDIENCE QUESTION: Who remembers that there was a companion CD you could buy?

---
class: single-image

![book cover - Design Patterns in Ruby](images/Design-Patterns-Ruby.jpg)

???

- AUDIENCE QUESTION: Who is familiar with the Ruby version?

---
class: single-image

![book cover - A Pattern Language: Towns, Buildings, Construction](images/A-Pattern-Language.jpg)

???

- AUDIENCE QUESTION: Is anyone familiar with *this* book?

- This is where the story starts

---
class: single-image

![book cover - The Oregon Experiment](images/Oregon-Experiment.jpg)

???

- ... or perhaps a little earlier

- There are 3 books in the series
    - The Oregon Experiment
        - First to be published - 1975

- University of Oregon
    - Early 1970s
    - Needed some new buildings
    - Existing campus buildings
        - Built mostly in the 1950s
        - Lots of plain concrete (brutalist)

---
class: single-image, wide

![McKenzie Hall - a very plain concrete building](images/McKenzie-Hall.png)

???

- Students and faculty hated it
- University administration asked students and faculty to be involved

---
class: single-image

![Christopher Alexander](images/Christopher-Alexander.jpg)

???

- They hired Christopher Alexander
    - "award-winning architect"
    - UC Berkeley
    - To design a process by which the community could create its own space
- Prominent in late 1960s
    - Notes on the Synthesis of Form (1964)
- Urban design, community design
- Had novel ideas/theories about architecture and design
    - More than just structure
    - Focused on people
        - People design their own spaces
    - Years in the making already

------

- [The Nature of Order](https://en.wikipedia.org/wiki/The_Nature_of_Order) (2002-2004)
    - 4 books on architecture, urban design, and the nature of beauty
    - https://www.npr.org/2005/01/29/4469331/christopher-alexanders-nature-of-order
    - seems to be 12 books in the series now, per Amazon, maybe?

- Defines design as "the process of inventing things which display new physical order, organization, form, in response to function...".

- https://wiki.c2.com/?ChristopherAlexander

- Designed and personally built over 100 buildings
    - both as an architect and a general contractor

- Born in Austria, English-American
- Died in 2022 (age 85)

---
class: single-image

![book cover - The Oregon Experiment](images/Oregon-Experiment.jpg)

???

- The Oregon Experiment (1975, vol 3)
    - Report on results of experiment
        - Hypotheses confirmed/refuted?
    - How did design processes work out?
    - Implementation - building new buildings
    - Cores of ideas to be refined in other 2 volumes

---
class: single-image

![book cover - A Pattern Language: Towns, Buildings, Construction](images/A-Pattern-Language.jpg)

???

- A Pattern Language (1977, vol 2)

- This is **the** book that first used the term "pattern" in this way
    - 253 patterns

- Patterns is one of the main topics of this talk
    - I'll get more in depth on this later

---
class: single-image

![book cover - The Timeless Way of Building](images/Timeless-Way.jpg)

???

- The Timeless Way of Building (1979, vol 1)
- Intro to the series
    - Companion to Pattern Language book
- Note that it's **the** timeless way
    - Historical and cross-cultural examples
    - Rejection of modern architecture industry
- New theory of architecture
    - Very old ideas
    - Focused on human needs and desires
        - Not on style or fashion
    - How people interact within a space
    - How people **use** a building
- Talks about the "quality without a name"
    - How we **feel** and interact with objects and spaces
    - The "life" in a building
    - The "soul", to borrow Saron's term
    - We should seek to include this in our buildings
- Buildings should be designed by the people who use them

------

- Weird format
    - Lots of italicized portions
        - Non-italicized sections provide more detail
    - Can read the book without reading non-italicized sections
    - In some ways more poetic than prose

---

class: single-image

![book cover - A Pattern Language: Towns, Buildings, Construction](images/A-Pattern-Language.jpg)

???

- What is a pattern language?

---
# Pattern Language

> A pattern language is an organized and coherent set of patterns ... that can be used in many ways within a specific field of expertise. <cite>-- Wikipedia</cite>

???

- Wikipedia says it well
    - A pattern language is an organized and coherent set of patterns ...
        - ... that can be used in many ways within a specific field of expertise.
- Maybe more of a "vocabulary" or "glossary" for a specific field

------

- https://en.wikipedia.org/wiki/Pattern_language

---
class: single-image

![book cover - A Pattern Language: Towns, Buildings, Construction](images/A-Pattern-Language.jpg)

???

- Every person and organization should have its own pattern language
    - But they should consist of mostly common patterns
- "A pattern language has the structure of a network." -- Christopher Alexander
    - Mathematical term: Graph
    - Patterns reference each other
        - ... creating a network of relationships amongst them
        - Build on others
        - Are built on top of others
- Patterns and languages are alive - constantly evolving

---
# Pattern

???

- But what is a pattern?

---
# Pattern

> Each pattern describes a problem which occurs over and over again in our environment, and then describes the **core** of the solution to that problem, in such a way that you can use this solution a million times over, without ever doing it the same way twice.

???

- A Pattern Language, page _x_ (emphasis mine):
    - "Each pattern describes a problem which occurs over and over again in our environment, and then describes the **core** of the solution to that problem, in such a way that you can use this solution a million times over, without ever doing it the same way twice."

---
# Pattern

- Common problem
- Context
- Solution
    - Invariants
    - Essence

???

- Description of a **common** problem
- Considers various "forces"
    - Constraints
    - Context
- Solution needs to balance these forces
    - One definition of engineering!
- Invariants/essence of solution
    - Common properties of all "good" solutions

---
# Pattern

- Hypothesis

???

- A hypothesis
    - Varying amounts of evidence
    - Some eventually proven wrong
    - Might be replaced by a better pattern

---
# Pattern

- Communication

???

- Common language for communicating within field

---
# Examples

- 2: The Distribution Of Towns
- 4: Agricultural Valleys
- 9: Scattered Work
- 10: Magic Of The City
- 12: Community Of 7000
- 14: Identifiable Neighborhood
- 17: Ring Roads
- 22: Nine Per Cent Parking
- 25: Access To Water
- 32: Shopping Street
- 56: Bike Paths And Racks

---
# Examples

- 61: Small Public Squares
- 78: House For One Person
- 128: Indoor Sunlight
- 129: Common Areas At The Heart
- 131: The Flow Through Rooms
- 140: Private Terrace On The Street
- 155: Old Age Cottage
- 177: Vegetable Garden
- 178: Compost
- 193: Half-Open Wall
- 203: Child Caves

---
# Example: Four-Story Limit

- There is abundant evidence to show that high buildings make people crazy.
- Therefore: In any urban area, no matter how dense, keep the majority of buildings four stories high or less. It is possible that certain buildings should exceed this limit, but they should never be buildings for human habitation.

???

- My favorite

------

- Source: https://www.patternlanguage.com/apl/apl21/apl21.htm
    - Requires a subscription

---
class: single-image

![Portion of the text of Pattern 21: Four-Story Limit](images/Four-Story-Limit.png)

???

- He cites multiple studies on effects of high-rise buildings
    - Kids on high floors get outside less
        - Compared to kids on lower floors
    - Kids on high floors have less social interaction
    - People on high floors are less likely to know their neighbors

---
class: single-image

![Ward Cunningham](images/Ward-Cunningham.jpg)

???

- AUDIENCE QUESTION: Who knows who this is?

- Ward Cunningham

- Cunningham's Law:
    - "The best way to get the right answer on the internet is not to ask a question; it's to post the wrong answer."
- 
- Coined term "Technical Debt" (1992)
- Invented the wiki (1995)
- Portland Pattern Repository (PPR)
    - People, Projects, Patterns
    - Ward Cunningham lives near Portland, Oregon
- Agile Manifesto (2001)

------

- FIT (Framework for Integrated Test)
- Eclipse Foundation

---
class: single-image

![Kent Beck](images/Kent-Beck.jpg)

???

- AUDIENCE QUESTION: Who knows who this is?

- Kent Beck

- Wrote **the** book on Extreme Programming (XP) (1999)
- Wrote **the** book on Test-Driven Development (TDD) (2002)
- Agile Manifesto (2001)
- Co-wrote JUnit

------

- "Make it work, make it right, make it fast"
- "Explore/Expand/Extract"
- "Test && Commit || Revert" (TCR)
    - Make **only 1** change in each commit
    - If the tests pass, commit
    - If the tests fail, revert completely and try again

- https://wiki.c2.com/?KentBeck

---
class: single-image, wide

![Ward Cunningham and Kent Beck](images/Ward-and-Kent.png)

???

- Ward and Kent worked together
    - Smalltalk
- In 1987, published "Graphical User Interfaces in Smalltalk"
    - First known publication of **software** "patterns"
- 1987 OOPSLA
    - Workshop: Specification and Design for Object-Oriented Programming
    - Paper: Using Pattern Languages for Object-Oriented Programs
- Strongly influenced by Christopher Alexander's patterns
- How did they find A Pattern Language?
    - Kent was at University of Oregon from 1979-1987
    - Edward Yourdon

------

- Photo credit: https://oandre.gal/beck-and-cunningham/
    - Similar to the one at https://wiki.c2.com/?WardAndKent
    - I couldn't find any others of them together
        - Kent says that's the only one he knows of!
- Source: https://oowisdom.csse.canterbury.ac.nz/index.php/Design_patterns
- Apparently Kent was at Apple at the time
    - https://c2.com/doc/oopsla87.html

---
class: single-image

![C2-Wiki](images/C2-Wiki.png)

???

- Over the next few years, more people got involved
    - Smalltalk community
    - Object-Oriented community - design, analysis, programming
- In 1995, Ward built a web site to collaborate
    - He wrote code for the site
        - Called it "wiki"
            - Hawaiian for "quick"
- C2 Wiki
    - Very first wiki!
    - C2 = Cunningham & Cunningham, Inc
    - Design Patterns
- Ward says wiki was a direct consequence of Alexander's work
    - Agile (XP) too!

------

- Other notables:
    - Ron Jeffries
    - Martin Fowler
    - Ralph Johnson
    - Erich Gamma
    - Grady Booch
    - James Coplien
    - Joshua Kerievsky
    - Michael Feathers

- Portland Pattern Repository (PPR)
    - People, Projects, Patterns
    - Ward Cunningham lives near Portland, Oregon

- https://en.wikipedia.org/wiki/Wiki_Wiki_Shuttle

---
class: single-image

![book cover - Design Patterns](images/Design-Patterns-book.webp)

???

- In 1994, **the** book on software design patterns was published
    - Erich Gamma, Richard Helm, Ralph Johnson, and John Vlissides
        - AKA "The Gang of Four" (GoF)

- Covers 23 patterns
    - Mostly in Java and C++
        - Some of these apply to Ruby; some do not

- Erich Gamma:
    - Started PhD in 1988
        - applying general idea of design patterns to software engineering
    - co-authored JUnit with Kent Beck

------

- Erich Gamma:
    - IBM Rational Jazz
    - Eclipse IDE (successor to Visual Age)
    - Visual Studio Code
    - https://wiki.c2.com/?ErichGamma

- https://wiki.c2.com/?GangOfFour

---
# Examples

- Singleton
- Factory
- Strategy
- Template Method
- Visitor

???

- These are all OOP patterns
    - They all involve classes and objects
- FP, procedural, and logic programming generally have their own patterns
    - They have different patterns to do similar things
    - Or don't need to do the thing at all
        - Or it's just a language feature

---
class: single-image

![book cover - Smalltalk Best Practice Patterns](images/Smalltalk-Best-Practice-Patterns.jpg)

???

- Smalltalk Best Practice Patterns (1996)
    - Kent Beck
    - 50 patterns
- Covers a lot of _smaller_ patterns
- IMHO, one of the best books on Ruby!
    - Nearly pre-dates Ruby!
    - Ruby is virtually a dialect of Smalltalk
        - Avi Bryant, RailsConf 2007

------

- RailsConf 2007 write-up: https://8thlight.com/insights/day-three-at-railsconf

---
# Examples

- Composed Method
- Query Method
- Method Object
- Decomposing Message
- Temporary Variable
- Simple Superclass Name
- Guard Clause
- Intention-Revealing Method

---
# Example: Query Method

- How do you represent testing a property of an object?
- Provide a method that returns a Boolean. Name it by prefacing
the property name with a form of “be” — is, was, will, etc.

---
class: single-image

![](images/Intention-Revealing-1.png)

???

- Probably my favorite pattern of all
- Selector: Smalltalk method name

------

- Source: https://ptgmedia.pearsoncmg.com/images/9780134769042/samplepages/013476904X.pdf

---
class: single-image

![](images/Intention-Revealing-2.png)

---
class: single-image

![book cover - Patterns of Enterprise Application Architecture](images/Patterns-of-Enterprise-Application-Architecture.jpg)

???

- Patterns of Enterprise Application Architecture (2002)
    - Martin Fowler
    - 42 patterns
- Targeted at _larger_ systems
- DHH learned patterns that he applied to Ruby on Rails
    - Active Record
    - Model-View-Controller
- Martin Fowler:
    - Refactoring book (1999, with Kent Beck)
    - Agile Manifesto (2001)

------

- https://martinfowler.com/eaaCatalog/

- Martin Fowler:
    - Chief Scientist, Thoughtworks
    - UML Distilled (1997)
    - Domain-Specific Languages book (2010)
    - Continuous Integration
    - Microservices
    - Domain-Specific Languages

---
# Software Design Pattern

- General solution to a common problem
- Not code
- Not an algorithm
- Blue-print of the outline of a solution

???

- How are software design patterns different?
    - Not much!
    - Common problem
    - Context
    - Solution

- Not code - cannot be copied and pasted
- Not an algorithm - not that specific
- Can be at any level of abstraction
    - From a single line of code to a whole system
- Often a "best practice"

---
# Software Design Pattern

- Name
- Intent
- Context
- Problem
- Solution
- Cross-references

???

- Same format as Christopher Alexander used
    - Roughly

---
# Architecture

> the complex or carefully designed structure of something

???

- Dictionary definition of "architecture"
- In many fields, "architecture" means "unchanging deep structure"

---
class: single-image, wide

![AI-generated picture of a majestic ornate building](images/Majestic-ornate-building.webp)

???

- We think of architecture as "big"
    - Buildings
    - Cities
    - Software systems

---
class: single-image

![Ornate details on a building](images/ornate-detail.jpg)

???

- But structure is fractal
    - We can see zoom in
    - See patterns at all levels
- But we can also think of "small" architecture
    - Rooms
    - Alcoves
    - Software components

---
class: single-image, wide

![Door knob and door lever](images/door_knob_vs_door_lever.jpg)

???

- For example, door knobs are an architectural element
    - Many famous architects have designed door knobs
        - I found knobs by Gaudi, Eames, Frank Lloyd Wright, and others

- I found 2 web pages that help choose between these 2 options
    - Levers are easier to use
    - Levers can be used with your hands are full
    - Levers are easier for young people, old people, disabled people
    - Levers can easily snag on clothing
    - Knobs have more styles available
    - Knobs can turn either way

------

- https://www.suffolklatchcompany.com/blogs/news/door-knobs-or-door-handles
- https://www.parkavenuelocks.com/blog/post/door-knobs-vs-door-levers-ending-the-debate

- I was surprised that Alexander's book didn't cover door knobs/handles

- Modern door knobs are a relatively recent invention!
    - 1878
    - Lever handles are much older

---
class: single-image, wide

![Material Design Buttons](images/material-design-buttons.webp)

???

- We rarely think of a button as an architectural element
- Part of the structure of an app
- Same kinds of decisions
    - Constraints
    - Context
    - Users interacting with them
- We want consistency
    - When contexts are similar

---
class: transition, middle, dot-dot-dot

# ...

---
class: single-image

![book cover - How Buildings Learn: What Happens After They’re Built](images/How-Buildings-Learn.jpg)

???

- Late into my research, I found this book
    - I had seen it before (recently)
        - But didn't think much about it

- How Buildings Learn: What Happens After They’re Built (1994)
    - Stewart Brand

- Inspired by Alexander's work
    - Extensive collaboration
    - Mentions "Chris Alexander" about every other page

- 6-part TV series for the BBC
    - Aired 1997 on BBC2

---
class: single-image

![Stewart Brand](images/Stewart-Brand.jpg)

???

- Stewart Brand
- Stanford
- MIT Media Lab
- Possibly coined “personal computer” (1974)
- "Information wants to be free"
- Whole Earth Catalog
- Director of the EFF (Electronic Frontier Foundation)
    - Digital rights and freedom
- Long Now Foundation
    - 10,000-year clock
    - 10,000-year library
    - Long Bets

------

- LSD studies (legal, early 1960s)
- Helped design and participated in Doug Engelbart's "mother of all demos” (1968)
- The Well (Whole Earth 'Lectronic Link) (1984) - first online community
- Director of the Electronic Frontier Foundation (EFF) (1990-1994)
- Founded (with Danny Hillis) the Long Now Foundation (1995)
 - “Why Haven’t We Seen A Photograph of the Whole Earth Yet?” (1966)
    - Accelerated NASA to get/publish high-quality color photos of Earth from space
        - The ecology movement took shape in 1970 partially as a result of those photos
        - Legend has it
    - https://sb.longnow.org/SB_homepage/WholeEarth_buton.html

---
class: single-image

![book cover - How Buildings Learn: What Happens After They’re Built](images/How-Buildings-Learn.jpg)

???

- So much to cover
    - IMHO, the best book on software engineering
        - That's not about software engineering

---
# How Buildings Learn

- A building is never finished
- Adapt to changing needs
- Design for change
- Change incrementally
- Learn as we go
- Maintenance is a form of evolution

???

- Do these sound familiar?
    - **Nearly all the lessons apply to software as well!**

- This sounds like Agile to me
    - Not the watered-down Scrum that we end up with
    - Incremental change
    - Focus on users
    - Adapting

---
class: single-image

![book cover - How Buildings Learn: What Happens After They’re Built](images/How-Buildings-Learn.jpg)

???

- "Buildings are predictions"
    - All predictions are wrong
    - Ergo, design so that it doesn't matter when we're wrong
- Choose options that provide more options in the future

------

- [Shearing layers](https://en.wikipedia.org/wiki/Shearing_layers)
    - SITE: changes every 50-500 years
    - STRUCTURE: foundation & load-bearing, rarely changed
    - SKIN: changes every 20 years, air-tight, better insulated
    - SERVICES: changes every 7-15 years
    - SPACE PLAN: interior layout, walls, ceilings, floors, doors. changes every 3-30 years
    - STUFF: "mobilia" in Italian

---
class: single-image

![book cover - How Buildings Learn: What Happens After They’re Built](images/How-Buildings-Learn.jpg)

???

- We shape our buildings, and our buildings shape us
    - Adaptation between buildings and users is slow and continuous process
- Over 50 years, the changes within a building cost more than the original building
    - 3x more for a commercial building
    - 6x more for a residential building
- Hire good builders and save money in the long run
- "temporary" is permanent most of the time
- Fail small, early, and often, and you will succeed in the long run

------

- "A new building is a bad teacher of maintenance habits, since deferring of maintenance is habit. A building that has been maintained for a long time is a good teacher, since its maintenance is a habit."

---
# Conclusions

- Pattern languages help us communicate
    - Solutions to common problems

???

---
# Conclusions

- Architecture is about structure
- Architecture is about people
    - Interactions is space and time
    - Interactions with people and objects

???

- In many fields, "architecture" means "unchanging deep structure"
    - But architecture **does** change
- Architecture is really about people
    - And how they interact with their environment

---
# Conclusions

- We can't predict what our future needs will be
    - Design for change, evolution, adaptation
    - Learning

???

---
# Conclusions

- Smalltalk's legacy is huge
    - OOP
    - Agile
    - Design Patterns

???

- A small group of people were involved in Smalltalk, OO, patterns, and Agile
    - Perhaps also Open Source
- Ruby is very much like Smalltalk
    - Many of these people now use Ruby
    - This is why Agile is so common in Ruby
- AUDIENCE QUESTION: Was anyone here involved in any of these?
    - I know that Brian Marick was here one year
        - He was involved in the Agile Manifesto
    - I'm just a tad too young

---
# Conclusions

- We can learn from other fields

???

---
class: single-image

![My house, a 2-story Victorian, with a 16-story high-rise looming over it](images/Our-House-Overwhelmed.jpg)

???

- This picture is blowing up on Facebook
    - Caption: "Overwhelmed?"
- This is my house
    - The one on the left
    - A 2-story Victorian
- The one on the right is a 16-story high-rise
- The owner of the house would not sell out
- Broke several patterns:
    - Four-Story Limit
    - Number of Stories
        - "Do not let the height of your building vary too much from the predominant height of surrounding buildings"
- Hedges nails pattern 140: Private Terrace
    - People cannot see us when we're sitting on front patio

---
# Resources

- [PatternLanguage.com](https://www.patternlanguage.com/)
- [How Buildings Learn](https://www.youtube.com/playlist?list=PLrg__Ji1S58TnecKCIFNskj-Q3P2NV0pw)
- [Using Pattern Languages for Object-Oriented Programs](https://c2.com/doc/oopsla87.html)
    - First paper on patterns in software
    - Ward Cunningham and Kent Beck
- [Christopher Alexander: An Introduction for Object-Oriented Designers - Doug Lea](https://gee.cs.oswego.edu/dl/ca/ca/ca.html)
- [Richard Gabriel: Patterns of Software](https://www.dreamsongs.com/Files/PatternsOfSoftware.pdf)
    
---
# Resources

- [Source Making](https://sourcemaking.com/design_patterns)
- [Awesome Design Patterns](https://github.com/DovAmir/awesome-design-patterns)
- [Martin Fowler's Software Architecture Guide](https://martinfowler.com/architecture/)
- [Patterns-Discussion FAQ](https://gee.cs.oswego.edu/dl/pd-FAQ/pd-FAQ.html)
- [Hillside Group](https://hillside.net/patterns/)

???

- There are a couple really good sites on design patterns
- Source Making is one of the best
    - It's also great for info on refactoring and anti-patterns
    - [Refactoring Guru](https://refactoring.guru/design-patterns) seems to be the same site
        - But different

---
# Resources

- A few patterns that I found independently and documented:
    - [Debugging Pattern – Grenade](https://web.archive.org/web/20161107180216/http://blog.boochtek.com/2012/01/11/grenade-debugging-pattern)
    - [Readable Shell Scripts](https://web.archive.org/web/20210510214107/http://blog.boochtek.com/2014/03/11/readable-shell-scripts)
    - [Ruby Pattern: Parameterized Module Inclusion](https://web.archive.org/web/20210510205350/http://blog.boochtek.com/2014/04/14/ruby-parameterized-module-inclusion)

---
# Feedback

- GitHub: [booch][github]
- Mastadon: [@CraigBuchek@ruby.social][mastadon]
- Twitter: [@CraigBuchek][twitter]
- Email: craig.buchek@gmail.com
- LinkedIn: https://www.linkedin.com/in/craigbuchek
- Resume: https://resume.craigbuchek.com


- Slides: http://craigbuchek.com/arch
    - Hit P to see notes
    - Source: https://github.com/booch/presentations

???

- One reason I give talks at conferences is to start a conversation
- Come talk to me
    - Or send me a message
    - Or send me a job offer :D
- Thank YOU for coming

------

- Thanks also to:
    - Madison Ruby+ organizers
        - For selecting my talk
    - Members of STL Linux meetup
        - Feedback on a preview version of the talk

- I used a tool called [Remark][remark] to create and show these slides.

[github]: https://github.com/booch
[mastadon]: https://ruby.social/@CraigBuchek
[twitter]: https://twitter.com/CraigBuchek
[remark]: http://remarkjs.com/

---

# Other Thoughts

???

------

- My thoughts on related terms:
    - A language-specific pattern is an "idiomatic" pattern
    - A "convention" is perhaps a pattern that is so common that it is not written down
    - A "framework" is a collection of patterns put to use in a specific way
    - An "anti-pattern" is a pattern that does **not** solve the problem well
        - But looks like it should
"feeling" should be the primary criterion used for making changes to any place
