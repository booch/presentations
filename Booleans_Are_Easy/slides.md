layout: true

<header>
  <p class="left">STL Ruby - 2018-03-12</p>
  <p class="right">@CraigBuchek</p>
</header>

<footer>
  <p class="left"><!-- page numbers
   --></p>
  <p class="right">https://craigbuchek.com/booleans</p>
</footer>

---
class: title, middle, center

# Booleans are Easy:
# True or False?
### Craig Buchek

???

* My Twitter is in the upper right corner if you want to tweet at me.
* The URL for the slides is in the lower right corner.
* Hit `p` for presenter notes.
    * Notes have more info than I'll talk about in some cases.

---

# Booleans as Parameters

~~~ ruby
random_object.class
# => User
~~~

???

* When I'm in Rails console, IRB, or Pry, I frequently want to see the class of an object

~~~ ruby
def random_object(cache: true)
  return @random_object if cache && @random_object_defined
  @random_object_defined = true
  random_object_index = Random.rand(ObjectSpace.each_object.count)
  @random_object = ObjectSpace.each_object.drop(random_object_index).take(1)
end
~~~

---

# Booleans as Parameters

~~~ ruby
random_object.methods
# => [:can?, :cannot?, :paper_trail_originator, :paper_trail_enabled_for_model?, :whodunnit]
~~~

???

* Often, I'll also want to see what methods the object can respond to.
* Show of hands - who's familiar with this method named `methods`?
* How many of you (with your hands up) know that it takes an optional parameter?
* How many of you remember whether to pass `true` or `false` to not show methods from superclasses?

---

# Booleans as Parameters

~~~ ruby
random_object.methods(false)
# => [:id, :first_name, :last_name]
~~~

???

* It happens to be `false` for this method.
* But to use it properly, you have to remember that.
* Can we do better?

---

# Booleans as Named Parameters

~~~ ruby
random_object.methods(superclass_methods: false)
# => [:id, :first_name, :last_name]
~~~

???

* The best way to fix this API is to use a named parameter to _describe_ the parameter.
* This method pre-dates named parameters in Ruby, though.
* It also needs to retain backwards compatibility.

---

# Booleans as Named Parameters

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

* My friend and colleague Amos Kind came across something like this once.
    * He submitted a pull request to make it more clear.
* We've got a predicate method, based on 2 other predicate methods.
    * _Predicate method_ just means that it returns `true` or `false`.
* Having an explicit `true` or `false` is a bit of a smell.
    * With possible exception of early `return` statements (guard clauses).
* Can we improve this code?

---

# Boolean Transformations

~~~ ruby
true || x == true       # Identity
false && x == false     # Nullification
x || y == y || x        # Commutation
x && y == y && x        # Commutation
x || !x == true         # Tautology
x && !x == false        # Contradiction
(!x || !y) == !(x && y) # De Morgan's laws
(!x && !y) == !(x || y) # De Morgan's laws
~~~

???

* The Boolean **and** and **or** operators are commutative.
    * Note that Ruby has short-cutting — different code might run, depending on order.
* [De Morgan's laws](https://en.wikipedia.org/wiki/De_Morgan%27s_laws)

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

* Now we have tools to refactor this to be more readable.

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




---
class: thanks

# Thanks


???

* Thank YOU for coming.
* Amos King for some examples of Boolean transformations.

---

# Feedback

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Slides: http://craigbuchek.com/booleans
    * Source: https://github.com/booch/presentations
    * [Remark][remark] presentation software



[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[craigbuchek]: http://craigbuchek.com
[boochtek]: https://www.boochtek.com
[tal]: http://www.thisagilelife.com


[remark]: http://remarkjs.com/
