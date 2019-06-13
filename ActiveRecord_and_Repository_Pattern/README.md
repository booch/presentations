Active Record, the Repository Pattern, and You
==============================================

This is my presentation for [RailsConf 2019][railsconf].

This talk is about (among other things) my [ActiveRecord-Repository][ar-repo] project.


Abstract
--------

ActiveRecord is big. You just won't believe how vastly, hugely, mind-bogglingly big it is.
It does a lot. Many would say it does too much.
For me, the biggest issue is that it combines 2 distinct pieces of functionality —
modeling the domain, and abstracting database access.

For years, I've dreamed of separating these 2, while still staying on Rails' golden path.
I finally found a way to do that.
The benefits are high: faster tests, simpler code, decoupling from the database,
automatic schema migrations — without much downside.
Let's take a look and see if it might be for you and your project.


Resources
---------

* [Slide show][current_slides] (current/working version)


---

[railsconf]: https://www.railsconf.com/
[ar-repo]: https://github.com/boochtek/activerecord-repository
[current_slides]: https://booch.github.io/presentations/ActiveRecord_and_Repository_Pattern/slides.html#1
[remark]: https://remarkjs.com/
