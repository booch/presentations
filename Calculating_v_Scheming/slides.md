layout: true

<header>
  <p class="left">@CraigBuchek</p>
  <p class="right">2017-09-18</p>
</header>

<footer>
</footer>

---
class: title, middle, center

# Why Calculating Is Better Than Scheming
## (A Critique of Abelson and Sussman)
## by Philip Wadler


### Papers We Love - STL
### Craig Buchek
### 2017-09-18

---

# The Paper

* Published in 1987
* Published in ACM SIGPLAN Notices
    * Volume 22 Issue 3, March 1987
    * [dl.acm.org/citation.cfm?id=24706](http://dl.acm.org/citation.cfm?id=24706)
* Free copy
    * [www.cs.kent.ac.uk/people/staff/dat/miranda/wadler87.pdf](https://www.cs.kent.ac.uk/people/staff/dat/miranda/wadler87.pdf)

---

# Premise

* ML-based languages are better than Scheme
    * At least in a teaching/learning scenario

---

# Not A Critique of SICP

* Says Abelson and Sussman's SICP:
    * Is a great book/course
    * Changed the way we teach Comp Sci
* Critique is **just** about the language choice


* Structure and Interpretation of Computer Programs
    * Teaches programming/engineering principles
    * Uses Scheme as the programming language

---

# Basis

* Based on "over 2 years" of 2 courses
    * Course for undergraduates
        * Using Abelson and Sussman's SICP
        * Using T (made to look like Scheme)
    * FP course for masters
        * Using KRC

???

* He wasn't even the one teaching the courses!

---

# The Author

* Philip Wadler


* A "God" of the functional programming world
* Involved in development of Haskell
* Added generic types to Java 5
* Current project:
    * Links language for writing web applications

---
class: single-image

# Philip Wadler

![Wadler wearing lambda t-shirt](wadler-lambda-shirt.jpg)

---

# Scheme-like

* Scheme (lexically-scoped Lisp dialect)
* Common Lisp
* T

---

# ML-like

* SASL
* KRC (Kent Recursive Calculator)
* Miranda
* LML
* Orwell (Wadler)

---

# Important Differences

* Most ML-like languages have:
    * Syntax closer to mathematical notation
    * Pattern-matching
    * Static typing
    * Lazy evaluation

---

# Real Premise

* The importance of these features
    * Primarily concerned with "learnability"

---

# Sections of the Paper

* Data types
* Program versus data
* Meta-programming (macros)
* Lazy evaluation

---

# Typing

* Helps think about functions
* Ensure that certain errors are caught earlier


"A large proportion of a beginner's -- or even an experienced programmer's -- errors are type errors."

---

# Type Inference

"A type inference system means that typing (of data) need not involve extra typing (with fingers)."

---

# Proofs

* Talks about proving properties of functions
* ML syntax and pattern matching makes it easier
* Lisp syntax makes it harder
* Infix notation makes algebraic manipulation easier
    * "This is one reason such notations have evolved."


* How important is this to learning programming?

---

# Syntax

"A good choice of notation can greatly aid learning and thought,
and a poor choice can hinder it."

---

# Abstraction

"Miranda allows one to write programs at a higher level of abstraction,
where the choice of abstraction is not important."

* ML supports abstract data types with ease
* Lisp likes to use lists everywhere
    * Where did I put that in my data structure?
        * In the car?
        * In the cdr?
        * In the caddaddr?

---

# Pattern Matching

* Cannot be used with abstract data types
    * He wrote something called Views to help

---

# No Pattern Matching - Scheme
~~~ scheme
(define (sum xs)
    (if (null? xs)
        0
        (+ (car xs) (sum (cdr xs)))))
~~~

---

# Pattern Matching - Miranda
~~~ ml
sum [] = 0
sum (x:xs) = x + sum xs
~~~

* I find this comparison to mainly be about syntax
    * I find it unfair to blame non-syntax issues

---

# Pattern Matching - Lisp with I-Expressions

~~~
define sum(xs)
    if null?(xs)
        0
        + car(xs) sum(cdr(xs))
~~~

---

# Pattern Matching - Lisp with Destructuring
~~~
(define (sum x:xs)
    (if (null? x:xs)
        0
        (+ x (sum xs))))
~~~

---

# Pattern Matching - Scheme with Case-Lambdas
~~~
(defn sum :case
    '() 0
    (x xs) (+ x (sum xs)))
~~~

---

# Homoiconicity

* Great for extending the language
    * He never mentions "macros"
    * He never mentions "meta-programming"
    * He never mentions "homoiconicity"
* Hard for students to "get"
    * When do I need to `quote`?
    * What's the difference between `cons` and `list`?
* Fails to show how ML is better

---

# List Comprehensions

* Shows how Miranda does "streams"
    * Similar to Python list comprehensions/generators
    ~~~
    sum [i*i | i ,_ [1..100]; odd i]
    ~~~


* I find list comprehensions fine for small examples
    * But in the real world, I'd rather have `map`

---

# Type Classes

* In Lisp, you need separate functions for separate types
    * Different functions for lists and streams
    * Is this still the case in modern Lisps?

---

# Lazy Evaluation

* Shows implementing `if` in Miranda
    * Easy
* Shows the problems implementing it in Lisp
    * But never shows **macros**!
* Doesn't show the downsides
    * Debugging
    * IO

---

# Sometimes Lazy

* Using blocks
    * Smalltalk was around in 1987
        * And popular
* Using lambdas
* Using macros

---

# My Take

* The arguments are weak
    * Doesn't do a good job of showing pros AND cons

---

# My Take

* Yes on syntax (to a degree)
    * Parens can get in the way
    * ML syntax seems to encourage simplicity
        * Refactoring to concise functions
    * Don't think prefix/postfix/infix makes a big difference

---

# My Take

* Yes on static typing
    * Probably preaching to the crowd on this one
    * Helps students (and us) find errors more quickly
    * Can be a hindrance though
        * Getting things exactly correct in order to compile

---

# My Take

* Pattern matching is nice to have, but not that important
    * Maybe I just don't "get" it
    * Prevents abstraction
    * Makes a good case that you see both cases explicitly
        ~~~
        (if (null? xs) 0 1)
        [] -> 0
        [x:xs] -> 1
        ~~~

---

# My Take

* No on lazy evaluation
    * All lazy makes it hard to debug and understand
    * Not hard to make laziness explicit where necessary
    * Distances you from what the computer is really doing

---

# Feedback

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Slides:
    * Source: https://github.com/booch/presentations
    * [Remark][remark] presentation software


[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[craigbuchek]: http://craigbuchek.com
[boochtek]: https://www.boochtek.com

[remark]: http://remarkjs.com/
