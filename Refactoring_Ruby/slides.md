layout: true

<header>
  <p class="left">STL Ruby</p>
  <p class="right">2017-03-13</p>
</header>


<footer>
  <p class="left">@CraigBuchek</p>
</footer>

---
class: title, middle, center

# Refactoring Ruby
### Craig Buchek

???

* Feel free to ask questions during!

---
class: affiliations

# About Me

* ![](craigbuchek.png) [Craig Buchek][craigbuchek]
* ![](boochtek.svg) [BoochTek][boochtek]
* ![](this_agile_life.jpg) [This Agile Life][tal]

* ![](stl_flag.png) St. Louis
* ![](hands_up_united.jpg) [Tech Institute](http://www.handsupunited.org/techimpact/)
* ![](ivan.jpg) Ivan


???

* I have a company called BoochTek
    * We do:
        * Web Development
        * Rails rescue projects
        * Agile player/coaching
        * DevOps
* I participate in a podcast called This Agile Life
    * Please subscribe
* I mentor teaching underprivileged kids
* I was told there must be at least 1 cat picture
    * So there's a picture of my cat, Ivan

---

# What Is Refactoring?

Modifying code to improve its internal structure,
without changing its external behavior,
in order to make it easier to understand and cheaper to modify

???

* Note each piece of that:
    * MODIFYING code
    * Improve INTERNAL structure
    * WITHOUT changing behavior
    * Easier to UNDERSTAND
    * CHEAPER to modify
* Note that NOT all clean-up and restructuring is _refactoring_
    * We often use the term incorrectly

---

# History of Refactoring

* Term first used by Ralph Johnson in 1990
* Popularized by Extreme Programming in 1999
* Martin Fowler's book written in 1999

???

* Ralph Johnson is also one of the "Gang of Four" that wrote the _Design Patterns_ book
* Sources:
    * http://wiki.c2.com/?HistoryOfRefactoring
    * https://en.wikipedia.org/wiki/Code_refactoring

---
class: single-image

# Refactoring - Canonical Reference

![](refactoring-fowler.jpg)

---
class: single-image

# Refactoring - Ruby Edition

![](refactoring-ruby.jpg)

---
class: single-image

# Refactoring - The Other Ruby Book

![](refactoring-ruby-other.jpg)

???

* I can't say as much about this book
    * I own it, but don't recall reading it

---

# Smaller Methods - Booleans

* Original

~~~ ruby
def deletable?
  if sequential_approvers_enabled?
    !answered?
  else
    true
  end
end
~~~

???

* Amos said:
    ~~~
    The `deletable?` logic here seemed a little strange to me.
    So I converted it to straight logic to see what is going on.

        a = sequential_approvers_enabled?
        b = answered?

    The above condition is equivalent to:

        (a && !b) || !a # applying the distribution property of the ||
        (a || !a) && (!b || !a) # side one is a tautology
        true && (!b || !a) # we can drop the true because true && c is always c
        (!b || !a) # applying De Morgan's Theorem
        !(b && a) # we can also use the commutative property to swap those just to look more like the original
        !(a && b)
    ~~~

---

# Smaller Methods - Booleans

* Amos's partial refactoring

~~~ ruby
def deletable?
  !(sequential_approvers_enabled? && answered?)
end
~~~

OR

~~~ ruby
def deletable?
  !sequential_approvers_enabled? || !answered?
end
~~~

---

# Smaller Methods - Booleans

* Amos's suggested refactoring

~~~ ruby
def deletable?
  sequential_approvers_disabled? || unanswered?
end

def unanswered?
  !answered?
end

def sequential_approvers_disabled?
  !sequential_approvers_enabled?
end
~~~

---
class: thanks

# Thanks


???

* Thank YOU for coming

---

# Feedback

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Slides: https://github.com/booch/presentations/
    * [Remark][remark] presentation software

???

* Credits:
    * Clip art from Clipart.co
* Presentation software:
    * [Remark][remark]


[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[craigbuchek]: http://craigbuchek.com
[boochtek]: https://www.boochtek.com
[tal]: http://www.thisagilelife.com


[remark]: http://remarkjs.com/
