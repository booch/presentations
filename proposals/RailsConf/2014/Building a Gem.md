Building a Gem
==============

Abstract
--------

When you've got some Ruby code to share with others, you should
not only push it to GitHub -- you should also publish it as a gem.

Building a gem is lot easier than you think. We can do it in 30 minutes.
We'll create a new gem, write the README, write some tests, write code
to pass the tests, push to GitHub, and publish the gem. We'll follow all
the "best practices", so we end up with a gem that works well out of the box.


Details
-------

This is pretty basic stuff, but you don't realize that until you either
do it the first time, or see someone do it.

I'll be sure to do some research into best practices, so the way we
teach people to create gems will be the best we can. For example, we'll
do README-driven TDD. We'll incorporate Ernie Miller's suggested `rake console`.

We'll talk a bit about semantic versioning and the `~>` (twiddle-wakka)
pessimistic version constraint for dependencies.


Pitch
-----

I've recently published a few small gems. I probably would have done
this sooner had I realized how easy it is. I'd written a couple gems
before, but was always pulling them from GitHub. It's so simple, I 
feel like I need to share it with the world.

I've done live coding at the local LUG and RUG meetings a few times.
I'll be sure to do a few more practice runs for a large group like
RailsConf.