layout: true

<header>
  <p class="left">Blue Ridge Ruby 2024</p>
  <p class="right">@CraigBuchek</p>
</header>

<footer>
  <p class="left"><!-- page numbers --></p>
  <p class="right">http://craigbuchek.com/nil</p>
</footer>

---
class: title, middle, center

# Nil
# Nothing Is Easy, Is It?

#### or

## A Talk About Nothing

### Craig Buchek

---
class: middle

* Slides: http://craigbuchek.com/nil


* Hit `P` to toggle presenter notes
    * References
    * More details than I will talk about

???

* If you want to follow along, or see the slides later, here's the URL.
    * It'll be in the lower right corner.
* Hit `P` for presenter notes.
    * Notes have links to things I reference.
    * Notes have more info than I'll talk about in some cases.
* My Twitter is in the upper right corner if you want to tweet at/about me.
    * I'm also on Mastodon, same username, @ruby.social
* AUDIENCE QUESTION: Who has seen a talk on Nil by Sandi Metz or Avdi Grimm?
    * I've got some big boots to fill!

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
class: agenda

# Agenda

- Basics
- Nil Parameters
- Safe Navigation
- The $Billion Mistake
- NoMethodError
   - Ruby's take on NullPointerException
- Other Anti-Patterns
- Null Object and Special Case
- Refactoring
- Type Safety

---
class: transition, basics

# Basics

???

* On to Ruby!

---

# Basics

~~~ ruby
a = nil
~~~

???

* Nil is pretty simple, right?
* You use it when no other value is valid.

---

# Basics

~~~ ruby
a = nil
a.class
# => NilClass
~~~

???

* `nil` is an instance of a class named `NilClass`.

---

# Basics

~~~ ruby
a = nil
a.object_id
# => 4

c = nil
c.object_id
# => 
~~~

???

* In fact, there's only 1 instance of `nil`.
* No matter how we get `nil`, it's always the same object.

------

* From the `object_id` documentation: "no two objects will share an id".

---

# Basics

~~~ ruby
NilClass.new
# => NoMethodError: undefined method `new' for NilClass:Class
~~~

???

* You can't create a new instance of NilClass.

---

# Basics

~~~ ruby
NilClass.ancestors
# => [NilClass, Object, Kernel, BasicObject]
~~~

???

---

# Basics

~~~ ruby
"this is false" unless nil
# => "this is false"

"this is false" unless false
# => "this is false"

nil == false
# => false

!!nil == false
# => true
~~~

???

* Ruby treats `false` and `nil` as false.
    * Everything else is treated as true.
    * We say that nil is "falsey".
* But `nil` and `false` are not equivalent.
    * They are only equivalent when used in a boolean test.

---

# Basics

~~~ ruby
expect(nil).to be_falsey
expect(nil).not_to be_truthy
~~~

???

* You might come across those terms ("truthy" and "falsey") in RSpec tests.

---

# Basics

~~~ ruby
v = nil
"variable is nil" if v.nil?
"variable is empty" if v.empty?
"variable is blank" if v.blank?
~~~

???

* I would not recommend relying on nil's truthiness in `if` statements.
* It's more *idiomatic* to use something more intention-revealing that returns a Boolean.

------

* This isn't as big a problem in Ruby as in other languages.
* I contend that automatic coercion to Booleans is the 2nd most expensive mistake in computer language design.
    * The most expensive mistake is null pointers (leading to null pointer exceptions).
        * See [Null References: The Billion Dollar Mistake](https://www.infoq.com/presentations/Null-References-The-Billion-Dollar-Mistake-Tony-Hoare)

---
class: transition, parameters

# Parameters

???

* Next we'll talk about `nil` used in parameters to methods.

---

# Parameters

~~~ ruby
random_object.class
# => User
~~~

???

* I spend a lot of time in Rails console, IRB, or Pry.
* I'll often want to see the class of an object.

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

# Parameters

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

# Parameters

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

# Named Parameters

~~~ ruby
random_object.methods(superclass_methods: false)
# => [:id, :first_name, :last_name]
~~~

???

* The best way to fix this API is to use a named parameter to _describe_ the parameter.
* This method pre-dates named parameters in Ruby, though.
* It also needs to retain backwards compatibility.

---

# Named Parameters

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

* Ideally, it'd be best just to have 2 separate methods.

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

# An Example from Rails

~~~ ruby
user.things(true)

user.things.reload
~~~

???

* I came across this a couple months ago, when upgrading to Rails 5.
* These both do the same thing.
* The first one was the original API in Rails to reload an association.
* The 2nd is the current API.
* The original API is deprecated as of Rails 5, and removed as of Rails 5.1.
* Not only is the new one clearer, but the old way can lead to some very subtle bugs.

---

# An Example from Rails

~~~ ruby
@clients.sales(limit: 10)
~~~

???

* This is [Rails issue #26413](https://github.com/rails/rails/issues/26413)
* The bug report complains that the sales are being reloaded.
* Show of hands - anyone see the issue?
* The `sales` association doesn't take a hash, it takes a boolean.
* Ruby treats the `limit: 10` hash as `true`, meaning "reload".


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
        * A play on "strongly typed" languages.
    * But this is an example where we've overused booleans.

---

# Primitive Obsession

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

* This version still has primitive obsession.
    * We just replaced Boolean primitives with symbol primitives.

---
class: transition, readability

# Readability

???

* Now that we have the proper tools, let's get to work.

---
class: transition, conclusion

# Conclusion

---
class: image-only, percent-30

# The Point

![Exclamation point](images/OCR-A_char_Exclamation_Mark.svg)

???

* The original code we looked at all *worked*.
* So what was the point in changing it?
* We read code more than we write it.
    * So we should optimize for reading.
    * So we should optimize for **understanding**.
* Abstractions are meant to help us understand things.
    * As Sandi says, take the time to find the **right** abstraction.
    * Sometimes that takes some extra work.
* Writing good code might take a little longer in the short run.
    * In the long run, it will pay off to write the code as well as you can.

---

# Conclusions

* Nil isn't always so simple
* Nil is often not the best choice
* Readability matters

???

* I hope I've shown that there's more to Nil than meets the eye.
* But the bigger point is that we can make our code easier to read and understand.
* Take a little time to make it easier for the next person who has to read your code.
    * More often than not, that person will be you.
    * Even if it's not you, helping out your teammates is the right thing to do.

---
class: thanks, image-only

# Thanks

![Thank you](images/Thank-you-word-cloud.jpg)

???

* Thank YOU for coming.
* Big thanks to Jeremy Fairbank for inspiring this talk.
* Avdi and Sandi for leading the way
    * And reviewing the talk
* Members of St. Louis Ruby Users group for feedback on a preview of the talk.
* Thanks to Blue Ridge Ruby for selecting my talk.


---

# Feedback

* GitHub: [booch][github]
* Mastadon: [@CraigBuchek@ruby.social][mastadon]
* Twitter: [@CraigBuchek][twitter]
* Email: craig@boochtek.com


* Slides: http://craigbuchek.com/nil
    * Source: https://github.com/booch/presentations

???

* One reason I give talks at conferences is to start a conversation.
* Please don't hesitate to come talk to me any time during the conference.

------

* I used a tool called [Remark][remark] to create and show these slides.


[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[mastadon]: https://ruby.social/@CraigBuchek
[twitter]: https://twitter.com/CraigBuchek
[craigbuchek]: http://craigbuchek.com
[boochtek]: https://www.boochtek.com


[remark]: http://remarkjs.com/
