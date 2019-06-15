Smaller!
========

This is my presentation for the [Agile Alliance Technical Conference 2017][aatc2017].
It's mostly about refactoring, but also touches on writing better tests,
story splitting, and making good commits.


Abstract
--------

As I've learned to improve the way I work, I've discovered that almost everything we do needs to be smaller.
We would benefit from smaller stories, smaller tests, smaller classes, smaller methods, and smaller commits.
In this workshop, we'll spend some time looking at how to make each of these things smaller,
and the advantages of spending the time to do so.
Then we'll break into pairs to work on some real code,
to get some practice in finding ways to improve our code by finding the smaller pieces.


Resources
---------

* [Details of my talk][aatc2017_buchek]
* [Slide show][current_slides] (current/working version)


Building a PDF
--------------

The conference asked me to provide a PDF of the slides in advance.
The tool I used to build the slide show ([Remark][remark]) recommends Chrome's "Print to PDF" feature.
Unfortunately that's not working too well in newer versions of Chrome --- it prints just the title page.
I found a tool called [DeckTape][decktape] that's made specifically to convert HTML slides to PDFs.
I downloaded DeckTape it into this directory. Then I run it with:

~~~ shell
rake
./decktape-1.0.0/phantomjs decktape-1.0.0/decktape.js --size 1024x768 slides.html slides.pdf
~~~


---

[aatc2017]: https://www.agilealliance.org/agile-alliance-technical-conference-2017/
[aatc2017_buchek]: https://aatc2017.sched.com/event/9PB0/keep-it-short-craig-buchek
[current_slides]: https://booch.github.io/presentations/Smaller/slides.html
[remark]: https://remarkjs.com/
[decktape]: https://github.com/astefanutti/decktape#readme
