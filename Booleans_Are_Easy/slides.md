layout: true

<header>
  <p class="left">RailsConf - 2018-04-17</p>
  <p class="right">@CraigBuchek</p>
</header>

<footer>
  <p class="left"><!-- page numbers --></p>
  <p class="right">http://craigbuchek.com/booleans</p>
</footer>

---
class: title, middle, center

# Booleans are Easy:
# True or False?
### Craig Buchek

???

* My Twitter is in the upper right corner if you want to tweet at me.

---
class: middle

* Slides: http://craigbuchek.com/booleans


* Hit `P` to toggle presenter notes
    * References
    * More details than I will talk about

???

* If you want to follow along, or see the slides later, here's the URL.
    * It'll be in the lower right corner.
* Hit `P` for presenter notes.
    * Notes have links to things I reference.
    * Notes have more info than I'll talk about in some cases.

---
class: middle, center, image-only

![Flag of St. Louis, Missouri](images/stl-flag.svg)

???

* I live in St. Louis.

---
class: middle, center, image-only

![Strange Loop logo](images/strange_loop_logo.jpg)

???

* So I can go to Strange Loop without traveling.
* I went last year.

------

* Strange Loop is a great conference.
    * Lots of things will be over your head.
    * It's inspirational to see all the advanced things going on.

---
class: middle, center, image-only, percent-70

![Elm logo](images/elm_logo.jpg)

???

* My favorite talk was on the pre-conference day, at Elm-Conf.

---
class: middle, center, image-only

![Title slide for Jeremy Fairbank's Elm-Conf 2017 talk](images/fairbank-title-slide.jpg)

???

* It was a talk on Booleans by Jeremy Fairbank.
* That talk inspired me to create this talk.
* Ruby is very different than Elm, so this talk is very different from Jeremy's.
* I highly recommend watching Jeremy's talk.

------

* Jeremy's video: [Solving the Boolean Identity Crisis by Jeremy Fairbank](https://www.youtube.com/watch?v=8Af1bh-BVY8)
* Jeremy's slides: [Slides for "Solving the Boolean Identity Crisis"](https://bit.ly/elm-bool)


---
class: transition, boolean_basics

# Boolean Basics

???

* On to Ruby!

---

# Boolean Basics

~~~ ruby
a = true
b = false
~~~

???

* Booleans are pretty simple, right?
* The value of a Boolean is either true or false.

---

# Boolean Basics

~~~ ruby
a = true
a.class
# => TrueClass
b = false
b.class
# => FalseClass
~~~

???

* `true` and `false` are instances of classes named `TrueClass` and `FalseClass`.

---

# Boolean Basics

~~~ ruby
a = true
c = true
a.object_id
# => 20
c.object_id
# => 20
( 1 + 1 == 2 ).object_id
# => 20
~~~

???

* In fact, there's only 1 instance of each.
* No matter how we get `true`, it's always the same object.

------

* From the `object_id` documentation: "no two objects will share an id".

---

# Boolean Basics

~~~ ruby
TrueClass.new
# => NoMethodError: undefined method `new' for TrueClass:Class
FalseClass.new
# => NoMethodError: undefined method `new' for FalseClass:Class
~~~

???

* You can't create a new instance of these classes.

---

# Boolean Basics

~~~ ruby
Boolean
# => NameError: uninitialized constant Boolean
TrueClass.ancestors
# => [TrueClass, Object, Kernel, BasicObject]
~~~

???

* Interestingly, there's no Boolean class in Ruby.
* This is apparently due to Ruby's Smalltalk heritage.

------

* This is partially because Ruby is dynamically typed.
    * There's no need to declare a variable as a Boolean.

---

# Boolean Basics

~~~ ruby
"this is true" if true
# => "this is true"
"123 acts like it's true" if 123
# => "123 acts like it's true"
"this object acts like it's true" if Object.new
# => "this object acts like it's true"
"this is false" unless false
# => "this is false"
"nil acts like it's false" unless nil
# => "nil acts like it's false"
~~~

???

* Anywhere Ruby expects a Boolean, you can use any object.
* Ruby treats `false` and `nil` as false.
    * Everything else is treated as true.
* You might hear the terms "truthy" and "falsey".
    * They express something that Ruby will interpret as true or false in this context.

---

# Boolean Basics

~~~ ruby
expect(123).to be_truthy
expect(subject.valid?).to be_falsey
~~~

???

* You might come across those terms in RSpec tests.

---
class: transition, boolean_parameters

# Boolean Parameters

???


---

# Boolean Parameters

~~~ ruby
random_object.class
# => User
~~~

???

* When I'm in Rails console, IRB, or Pry, I frequently want to see the class of an object.

------

* I actually wrote a method to get a random object:

~~~ ruby
def random_object(cache: true)
  return @random_object if cache && @random_object_defined
  @random_object_defined = true
  random_object_index = Random.rand(ObjectSpace.each_object.count)
  @random_object = ObjectSpace.each_object.drop(random_object_index).take(1)
end
~~~

---

# Boolean Parameters

~~~ ruby
random_object.methods
# => [:can?, :cannot?, :paper_trail_originator, :paper_trail_enabled_for_model?, :whodunnit]

random_object.class.instance_methods
# => [:can?, :cannot?, :paper_trail_originator, :paper_trail_enabled_for_model?, :whodunnit]
~~~



???

* Often, I'll also want to see what methods the object can respond to.
* I'll use a method that's on `Object`, named `methods`.
    * Or a method that's on `Class`, named `instance_methods`.
* Notice that these usually return a long list of methods.
    * They're running off the right side of the text box here.
* Show of hands - who's familiar with either of these methods?
* How many of you (with your hands up) know that they take an optional parameter?
* How many of you remember whether to pass `true` or `false` to not show methods from superclasses?

---

# Boolean Parameters

~~~ ruby
random_object.methods(false)
# => [:id, :first_name, :last_name]

random_object.class.instance_methods(false)
# => [:id, :first_name, :last_name]
~~~

???

* It happens to be `false` for these methods.
* But to use it properly, you have to remember that.
* Can we do better?

---

# Boolean Named Parameters

~~~ ruby
random_object.methods(superclass_methods: false)
# => [:id, :first_name, :last_name]
~~~

???

* The best way to fix this API is to use a named parameter to _describe_ the parameter.
* This method pre-dates named parameters in Ruby, though.
* It also needs to retain backwards compatibility.

---

# Boolean Named Parameters

~~~ ruby
class Object
  def methods(options = [])
    show_superclass_methods = options &&
                              options.respond_to?(:[]) &&
                              options[:superclass_methods]
    if show_superclass_methods
      show_all_methods_this_object_responds_to
    else
      show_methods_from_immediate_class_of_this_object
    end
  end
end
~~~

???

* In older Ruby versions, we would have to use an options hash to emulate named parameters.
    * TODO: Find references to Avdi and Sandi recommending this technique.
* We still need to use an options hash to support taking a bare Boolean or a Hash.

---

# Single Responsibility Principle

~~~ ruby
random_object.methods
# => [:id, :first_name, :last_name]
random_object.all_methods
# => [:can?, :cannot?, :paper_trail_originator, :paper_trail_enabled_for_model?, :whodunnit]
~~~

???

* But really, it'd be best just to have 2 separate methods.

---

# Single Responsibility Principle

~~~ ruby
random_object.methods(true)
# => [:id, :first_name, :last_name]
random_object.methods(false)
# => [:can?, :cannot?, :paper_trail_originator, :paper_trail_enabled_for_model?, :whodunnit]
~~~

???

* How would you describe what this original method does?
    * "Show the methods defined for this object OR the methods only defined by its immediate class."
* Any time you have an "OR" (or "AND") in the description of a method or class, that's a code smell.
    * There's probably a violation of the Single Responsibility Principle.

---
class: transition, connascence

# Connascence

???

* We're going to take a short detour here to talk about something called "connascence".

---

# Connascence

> _common birth or production of multiple things at the same time_

> _the act of growing together_

???

* Definitions are from Webster's dictionary, 1913.

---

# Connascence

> _measurement of the amount of coupling (dependencies) among components of an OOP software system_

???

* Concept in OOP was first introduced in 1992, by Meilir (may-LEER) Page-Jones.
    * [Comparing techniques by means of encapsulation and connascence](https://dl.acm.org/citation.cfm?id=130994.131004) in Communications of the ACM, 1992
        * PDF: [http://wiki.cfcl.com/pub/Projects/Connascence/Resources/p147-page-jones.pdf]
    * [What Every Programmer Should Know About Object-Oriented Design](https://www.amazon.com/dp/0932633315/), 1996
    * [Fundamentals of Object-Oriented Design in UML](https://www.amazon.com/dp/020169946X), 1999
* Links to those are in the presentation notes.
    * I did find a link to the full text of the ACM article.
    * I also included some links to other articles and sites talking about connascence.

------

* Additional resources:
    * [Wikipedia article on connascence](https://en.wikipedia.org/wiki/Connascence)
    * A nice reference site: [connascence.io](http://connascence.io/)
    * An excellent [blog post on connascence](https://www.codesai.com/2017/01/about-connascence)

---

# Connascence

![Jim Weirich](images/jim-weirich-2014.jpg)

???

* Jim Weirich brought the idea of connascence to the Ruby community in 2009.

---

# Connascence

> _Two pieces of code share connascence when changing one requires a corresponding change in the other._

> _Excessive connascence means the system is hard to change and hard to maintain._

???

* Jim Weirich gave a few different talks on connascence.
    * [Grand Unified Theory of Software Design](https://vimeo.com/10837903)
        * Slides: https://github.com/jimweirich/presentation_connascence
        * Has a very similar example to my `methods` example.
        * Another version of the talk, with better audio, but worse video: https://vimeo.com/10837903
    * [The Building Blocks of Modularity](https://www.youtube.com/watch?v=l780SYuz9DI)
        * Same slides as above, but shown in video; poor audio
    * [Connascence Examined](https://www.youtube.com/watch?v=HQXVKHoUQxY) - new talk in 2012
        * Slides: https://github.com/jimweirich/presentation-connascence-examined
    * Makes the argument that connascence underlies many other rules of good OOP design.
        * DRY
        * Code smells
        * Race conditions

---

# Connascence

* Connascence of Name
* Connascence of Type
* Connascence of Meaning
* Connascence of Position
* Connascence of Algorithm

???

* This is a list of the types of static connascence.
    * There are dynamic types of connascence too.
* Connascence of Name
    * Agreement on the name of something
    * Example: any time we call a method
    * Example: any time we reference a variable or a constant
* Connascence of Type
    * Agreement on the type of something
* Connascence of Meaning
    * Agreement on the meaning or interpretation of specific values
* Connascence of Position
    * Agreement on the order of values
* Connascence of Algorithm
    * Agreement on a particular algorithm
    * Example: encoding/decoding passwords
    * Example: checksum on credit card numbers
* This list is from weakest connascence to strongest.
    * The dynamic types of connascence are all stronger then these.
* If we can replace a stronger form of connascence with a weaker form, we've reduced connascence.
* Increasing locality of connascent components is another way to reduce connascence.
* Note that Connascence of Name is weaker than Connascence of Meaning.

---

# Connascence

~~~ ruby
random_object.methods(false)
~~~

~~~ ruby
random_object.methods(superclass_methods: false)
~~~

???

* That's what we did here.
* We replaced a positional parameter with a named parameter.
* The positional parameter has a specific meaning, which is more difficult to remember.
* We decreased connascence by replacing Connascence of Meaning with Connascence of Name.

---
class: transition, boolean_states

# Boolean States

---

# Boolean States

~~~ ruby
class Editor
  attr_accessor :editing  # boolean
  attr_accessor :saving   # boolean
  attr_accessor :error    # boolean

  def render
    if editing
      render_document
    elsif saving
      render_saving
    elsif error
      render_error_message
    end
  end
end
~~~

???

* Let's say we've got an Editor class, and it has several booleans representing possible states.
* Our editor class may need to keep track of whether the user is in the process of editing.
* And the user might be in the middle of saving the document.
* And we might have an error condition that we need to show the user.
* Anyone see the problem with this class?
* The problem with this that we can end up with a combination of states that makes no sense.
    * Or what would it mean to be both editing and saving?
    * If `error` is true, then the other fields in the object have no meaning.
* We should try to ensure that our code can never get into an impossible state.
* How can we improve this?

---

# Boolean States

~~~ ruby
class Editor
  attr_accessor :state  # symbol

  def render
    case state
    when :editing
      render_document
    when :saving
      render_saving
    when :error
      render_error_message
    else
      fail "This shouldn't happen"
    end
  end
end
~~~

???

* We should use a single field to represent the state.
* We can use one of the state machine gems, or implement our own.
    * The gems usually have some other nice features that are also helpful.
* This doesn't look like a big improvement.
    * But it prevents us from ever getting into a state that is meaningless or invalid.
    * It ensures that the order of the options in (what's now) our case statement doesn't matter.
* Can we do better still?

---

# Boolean States

~~~ ruby
class Editor
  attr_accessor :state  # object of class State

  def render
    if state.editing?
      render_document
    elsif state.saving?
      render_saving
    elsif state.error?
      render_error_message
    end
  end
end
~~~

???

* We can use a State class, and use methods instead of symbols.
    * This allows us to catch bugs earlier.
        * Because Ruby will catch an incorrect method name more easily than a mis-typed symbol.
* What else can we do?

---

# Boolean States

~~~ ruby
class Editor
  attr_accessor :state  # object of class State

  def render
    if state.editing?
      render_editor
    else
      state.render
    end
  end
end
~~~

???

* If we have a sufficiently-specialized State class, maybe we can just delegate to the state object itself.

---
class: transition, primitive_obsession

# Primitive Obsession

???

* The original version of that code contains a code smell named "primitive obsession".


---

# Primitive Obsession

~~~ ruby
class Editor
  attr_accessor :editing  # boolean
  attr_accessor :saving   # boolean
  attr_accessor :error    # boolean

  def render
    if editing
      render_document
    elsif saving
      render_saving
    elsif error
      render_error_message
    end
  end
end
~~~

???

* It's using a primitive type when it'd be better to use a more specialized type.
    * Example: Using a floating point number to represent money
    * Example: Using a string to represent a URL
* In Ruby, we're more likely to abuse strings in this way.
    * That's often referred to as "stringly typed".
    * But this is an example where we've overused booleans.

---
class: transition, exponential_complexity

# Exponential Complexity

---

# Exponential Complexity

~~~ ruby
def render_editor(document, error_message, editing, saving, error)
end
~~~

???

* Let's say we had a method to render the document, taking each of those 3 boolean options.
* And for this example, let's say that the states are independent of each other.
* How many different cases would we have to handle if this method takes 3 boolean values?

---

# Exponential Complexity

~~~ ruby
def render_editor(document, error_message, editing, saving, error)
  method1 if editing && !saving && !error
  method2 if editing && saving && !error
  method3 if editing && saving && error
  method4 if editing && !saving && error
  method5 if !editing && saving && !error
  method6 if !editing && saving && error
  method7 if !editing && !saving && error
  method8 if !editing && !saving && !error
end
~~~

???

* We'd have to handle 8 different cases for 3 independent boolean variables.
* If you're lucky, you'll be able to write it something like this.

---

# Exponential Complexity

~~~ ruby
def render_editor(document, error_message, editing, saving, error)
  if editing
    if saving
      if error
        method1
      else
        method2
      end
    else
      if error
        method3
      else
        method4
      end
    end
  else
    if saving
      if error
        method5
      else
        method6
      end
    else
      if error
        method7
      else
        method8
      end
    end
  end
end
~~~

???

* If you're unlucky, it'd probably look more like this.
* That's a method with 29 lines of code -- too big to fit on the screen here.
* The formula for the number of conditions is `2^n` for n independent boolean variables.
    * That's the bad kind of exponential growth.

---
class: transition, readability

# Readability

---

# Readability of Predicate Methods

~~~ ruby
def deletable?
  if approvers_enabled?
    !answered?
  else
    true
  end
end
~~~

???

* My friend and colleague Amos King came across something like this once.
    * He submitted a pull request to make it more clear.
* We've got a predicate method, based on 2 other predicate methods.
    * _Predicate method_ just means that it returns `true` or `false`.
* Having an explicit `true` or `false` is a bit of a smell.
    * With possible exception of early `return` statements (guard clauses).
* Can we improve this code?

---
class: transition, boolean_transformations

# Boolean Transformations

???

* We're going to need some tools to refactor that to make it more readable.

---

# Boolean Transformations

~~~ ruby
x || !x == true                         # Tautology
x && !x == false                        # Contradiction
true || x == true                       # Identity law
false && x == false                     # Nullification law
x && x == x                             # Idempotent law
x || x == x                             # Idempotent law
x || y == y || x                        # Commutative law
x && y == y && x                        # Commutative law
x || (y || z) == (x || y) || z          # Associative law
x && (y && z) == (x && y) && z          # Associative law
(!x || !y) == !(x && y)                 # De Morgan's law
(!x && !y) == !(x || y)                 # De Morgan's law
x && (y || z) == (x && y) || (x && z)   # Distributive Law
x || (y && z) == (x || y) && (x || z)   # Distributive Law
~~~

???

* There's a set of laws that govern transforming boolean expressions.
    * We can use these to refactor or simplify code.
* Note that they come in pairs -- one for **and**, one for **or**.
    * This is because fundamentally, we could just have one of those, plus **not**.
* The Boolean **and** and **or** operators are commutative.
    * Note that Ruby has short-cutting — different code might run, depending on order.
        * But the **result** will be the same either way.
* That's a lot of transformations for only 2 possible values and 3 operators.
    * There are actually more than this.
        * For example, _modus ponens_ and _modus tollens_.
* [De Morgan's laws](https://en.wikipedia.org/wiki/De_Morgan%27s_laws)
* [Boolean algebra](https://en.wikipedia.org/wiki/Boolean_algebra)

---

# Readability of Predicate Methods

~~~ ruby
def deletable?
  if approvers_enabled?
    !answered?
  else
    true
  end
end
~~~

???

* Now that we have the proper tools, let's get to work.

---

# Readability of Predicate Methods

~~~ ruby
def deletable?
  !approvers_enabled? || !answered?
end
~~~

???

* We can apply some of the transformations to get rid of the `if` and the explicit `true`.

---

# Readability of Predicate Methods

~~~ ruby
def deletable?
  approvers_disabled? || unanswered?
end

def unanswered?
  !answered?
end

def approvers_disabled?
  !approvers_enabled?
end
~~~

???

* We can refactor to extract some methods to make things more clear.
* Don't be afraid to extract methods for sub-expressions.
    * Even if they're used in only 1 place.
    * Even if it's just to invert the _sense_.

---
class: transition, conclusion

# Conclusion

---

# Conclusions

* Booleans aren't so simple
* Readability matters
* Empathy

???

* I hope I've shown that there's more to Booleans than meets the eye.
* But the bigger point is that we can make our code easier to read and understand.
* Take a little time to make it easier for the next person who has to read your code.
    * More often than not, that person will be you.
    * Even if it's not you, helping out your teammates is the right thing to do.

---
class: thanks

# Thanks


???

* Thank YOU for coming.
* Big thanks to Jeremy Fairbank for inspiring this talk.
* Thanks to my company, F5, for sponsoring my travel.
    * I believe we have a few positions open for Web Developers.
* Amos King for some examples of Boolean transformations.
* Members of St. Louis Ruby Users group for feedback on a preview of the talk.
* Members of my team at F5 for feedback on a preview of the talk.
* Thanks to RailsConf for selecting my talk.

---

# Feedback

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Slides: http://craigbuchek.com/booleans
    * Source: https://github.com/booch/presentations

???

* One reason I give talks at conferences is to start a conversation.
    * Please don't hesitate to come talk to me any time during the conference.

------

* I used a tool called [Remark][remark] to create and show these slides.


[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[craigbuchek]: http://craigbuchek.com
[boochtek]: https://www.boochtek.com
[tal]: http://www.thisagilelife.com


[remark]: http://remarkjs.com/
