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

# Nothing Is Easy, Is It?

## A Talk About Nothing (Nil)

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
* AUDIENCE QUESTION: Who knows the costliest mistake in computer programming?
    * ANSWER: Null pointers, according to Tony Hoare (who invented them)
        * It has probably cost businesses several billion dollars over the years
    * Second most costly mistake is automatic coercion to Booleans
* AUDIENCE QUESTION: Who has seen a talk on Nil by Sandi Metz or Avdi Grimm?
    * I've got some big boots to fill!

---
class: agenda

# Agenda

* Basics
* Nil Parameters
* NoMethodError
    * Ruby's take on NullPointerException
* The Billion Dollar Mistake
* Safe Navigation
* Other Anti-Patterns
* Null Object and Special Case
* Refactoring
* Type Safety

???

* I'm going to start with the basics
* Then some anti-patterns, and why they're problematic
* Then some better alternatives, and refactoring

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
# => 4
~~~

???

* In fact, there's only 1 instance of `nil`.
* No matter how we get `nil`, it's always the same object.
* Nil's object ID is always 4.
    * Ruby has a few objects that always have the same object_id:
        * false:  0
        * true:   2
        * nil:    4

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

* NilClass is a direct descendent of the Object class
    * Most classes in Ruby inherit from Object
* BasicObject is the top of the Ruby object hierarchy
    * It has only 12 methods
        * Mostly just equality and message passing
    * BasicObject is primarily used for creating proxy objects
        * Like the `delegate` method in Rails
        * Messages passed to a proxy object get passed to the target object that it's proxying
            * We want as many methods as possible to be forwarded to the target object of the proxy
* Kernel adds ~50 more methods
    * Mostly for IO, system calls, and process management
    * Methods that seemingly take no receiver
    * Things like:
        * puts, open, readlines
        * sleep
        * require
        * raise, throw, catch
            * These are just (special) methods in Ruby!
        * system, fork
        * binding, caller, class
            * Info about the current context

---

# Basics

~~~ ruby
NilClass.methods - Object.methods
# => []
~~~

???

* NilClass adds no methods other than those inherited from Object

---

# Basics

~~~ ruby
nil.nil?
# => true

false.nil?
# => false

Object.new.nil?
# => false

0.nil?
# => false
~~~

???

* Its only interesting overridden method is `nil?`
    * Which always returns `true` for `nil`
    * Every other Object returns `false`
        * BasicObject doesn't have a `nil?` method
            * It will raise a `NoMethodError`

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
    * We say that `nil` is "falsey".
* But `nil` and `false` are not equivalent.
    * They are only equivalent when used in a boolean test.
* Unlike "truthy" and "falsey", there is no "nilish" concept in Ruby.

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

"variable is falsey" unless v

"variable is nil" if v.nil?
"variable is empty" if v.empty?

"variable is blank" if v.blank?
"variable is not present" unless v.present?
~~~

???

* The `blank?` and `present?` methods are from Rails' ActiveSupport.
    * Not built into Ruby
    * Commonly used in Rails applications.
* I do not recommend relying on `nil`'s truthiness in `if` statements.
* It's more *idiomatic* to use something more explicitly intention-revealing that returns a Boolean.
    * Like `nil?`, `empty?`, or `blank?`

------

* This isn't as big a problem in Ruby as in other languages.
* I contend that automatic coercion to Booleans is the 2nd most expensive mistake in computer language design.
    * 0 and empty arrays are equal to false in many languages.
    * The most expensive mistake is null pointers (leading to null pointer exceptions).
        * See [Null References: The Billion Dollar Mistake](https://www.infoq.com/presentations/Null-References-The-Billion-Dollar-Mistake-Tony-Hoare)

---

# Basics

~~~ ruby
nil.inspect
# => "nil"

nil.to_s
# => ""

nil.to_i
# => 0

nil.to_a
# => []

nil.to_h
# => {}
~~~

???

* Converting `nil` to various types results in an empty or zero value.

---

# NoMethodError

---

# Safe Navigation

* Ruby 2.3 introduced the safe navigation operator `&.`

~~~ ruby
account = nil

account.owner.address.zip_code
# => undefined method `owner' for nil (NoMethodError)

account&.owner&.address&.zip_code
# => nil
~~~

???

* AKA the "lonely operator"
    * Matz says it looks like a person standing alone, looking around for someone to talk to.
    * The person is looking at the `.` operator.
        * JavaScript and other languages use `?.` for this operator.
* TODO: Show the difference between `&.` and `&&`
* TODO: https://thoughtbot.com/blog/ruby-safe-navigation

---

# Safe Navigation

> Note that `&.` skips only one next call, so for a longer chain it is necessary to add operator on each level

???

* Source: https://docs.ruby-lang.org/en/master/syntax/calling_methods_rdoc.html

---

# Try

* Before the safe navigation operator, Rails had `try`

~~~ ruby
account = nil

account.owner.address.zip_code
# => undefined method `owner' for nil (NoMethodError)

account.try(:owner).try(:address).try(:zip_code)
# => nil
~~~

???

* Rails' ActiveSupport had the `try` method before Ruby had the "safe navigation operator"
* Does `responds_to?` to avoid **any** NoMethodError
* Try is slightly different than the safe navigation operator
    * If the receiver is `false`, the safe navigation operator will return `false`
        * The safe navigation operator treats false as a valid value
    * Try will return `nil` if any of the methods raise an exception
    * It's a method call that uses some metaprogramming
    * It might return `false` instead of `nil` in some cases
    * It can take a block???
    * It can take multiple arguments???
    * It's still useful in some cases

---

# Try

~~~ ruby
account.try(:owner).try(:address).try(:zip_code) { "00000" }
# => "00000"

account && account.owner && account.owner.address
# => false
~~~

???

* TODO: See https://mitrev.net/ruby/2015/11/13/the-operator-in-ruby/
* TODO: See https://stackoverflow.com/a/45825498/26311

---

# Dig

~~~ ruby
address = params[:account].try(:[], :owner).try(:[], :address)
address = params[:account].fetch(:owner) { {} }.fetch(:address)
address = params.dig(:account, :owner, :address)
~~~

???

* TODO: See https://mitrev.net/ruby/2015/11/13/the-operator-in-ruby/

---

# Law of Demeter

* The Law of Demeter is a design guideline for object-oriented programming
* It's often summarized as "only talk to your immediate friends"
    * Don't talk to strangers
    * Don't talk to your friends' friends
    * Don't talk to your friends' friends' friends
* The safe navigation operator is often used to follow the Law of Demeter
* But it's not a silver bullet
    * It can lead to long chains of method calls
    * It can lead to "train wrecks"
* Sometimes it's OK to break the Law of Demeter
    * But it's a code smell
    * It's a sign that you might need to refactor

???

* TODO: More on the Law of Demeter

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

* The best way to fix this API is to use a named parameter to *describe* the parameter.
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
* Email: <craig@boochtek.com>


* Slides: <http://craigbuchek.com/nil>
    * Source: <https://github.com/booch/presentations>

???

* One reason I give talks at conferences is to start a conversation.
* Please don't hesitate to come talk to me any time during the conference.

------

* I used a tool called [Remark][remark] to create and show these slides.


[github]: https://github.com/booch
[mastadon]: https://ruby.social/@CraigBuchek
[twitter]: https://twitter.com/CraigBuchek


[remark]: http://remarkjs.com/
