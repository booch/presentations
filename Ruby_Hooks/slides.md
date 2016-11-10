layout: true

<header>
  <p class="left">RubyConf</p>
  <p class="right">2016-11-10</p>
</header>


<footer>
  <p class="left">@CraigBuchek</p>
</footer>

---
class: title, middle, center

# A Look at Hooks
### Craig Buchek

???

* Feel free to ask questions during!

---
class: affiliations

# About Me

* ![](craigbuchek.png) [BoochTek][boochtek]
* ![](this_agile_life.jpg) [This Agile Life][tal]
* ![](stl_flag.png) St. Louis

* ![](binary_noggin.png) [Binary Noggin][binary_noggin]
* ![](hands_up_united.jpg) [Tech Institute](http://www.handsupunited.org/techimpact/)
* ![](ivan.jpg) Ivan

???

* I have a company called BoochTek
    * We do:
        * Web Development
        * Rails rescue projects
        * Agile player/coaching
        * DevOps
* I do a lot of work through Binary Noggin
    * We have developers available starting in January
* I participate in a podcast called This Agile Life
    * Please subscribe
* I mentor teaching underprivileged kids
* I was told there must be at least 1 cat picture
    * So there's a picture of my cat

---
class: what_is_a_hook

# What Is a Hook?

* A method:
    * Called implicitly by Ruby
    * We never call ourselves

???

* Definition I'm using in this talk:
    * A method that's called implicitly by Ruby
    * And that we never call ourselves
* Because it's implicit:
    * Can be surprising
    * Can be difficult to troubleshoot
* "Spooky action at a distance"
    * A term from physics
* In Ruby docs, you'll see them referenced as:
    * "Hook"
    * "Callback"
        * But that has more meanings
    * "Ruby calls"
* I'm covering only hooks in Ruby itself

---

# BasicObject#initialize

~~~ ruby
class X
  def initialize
    puts "Initializing an instance of X"
  end
end

x = X.new
~~~

~~~ output
Initializing an instance of X
~~~

???

* Who here has used `initialize`?
    * Pretty much everyone, probably
* Notice that we never explicitly called `initialize`
    * But it got called anyway
* This is by far the most commonly used hook in Ruby

---

# Class#new: Behind the Scenes

~~~ ruby
x = X.new
~~~

~~~ ruby
class Class
  def new(*args, &block)
    object = allocate # Allocate space in memory to hold the object
    object.initialize(*args, &block) if object.respond_to?(:initialize)
    return object
  end
end
~~~

* `X` is an object of class `Class`
    * So calling `X.new` calls `Class#new`

???

* So what's really happening when we call `X.new`?
* `X` is an object of class `Class`
    * So calling `X.new` calls `Class#new`
    * Seems weird, but how every method call works
        * Find the class of what's before the dot
        * Call the instance method from that class
* Because the call to `initialize` is hidden, it's a hook
* NOTE: This code is actually implemented in C
    * It also calls `initialize` via `__send__`
        * So it will work if `initialize` is private
* NOTE: Understanding that classes are instances of the `Class` class is tricky
    * If you need to, take some time to work through thinking about it

---

# Meta-Programming Basics

* `method_missing`
* `respond_to_missing?`

???

* Meta-programming is where you're most likely to use hooks

---

# BasicObject#method_missing

~~~ ruby
class X
  def method_missing(method_name, *args, &block)
    puts "Method called on an X: #{method_name}, args: #{args}"
  end
end

X.new.some_method(1, "a", :b)
X.new.another_method
~~~

~~~ output
Method called on an X: some_method, args: [1, "a", :b]
Method called on an X: another_method, args: []
~~~

???

* How many of you have used `method_missing`?
    * Probably a large percentage
* We're allowing the calling of a method that we never defined
* Pretty commonly used for meta-programming
* ActiveRecord uses `method_missing` in several places
* Biggest downside --- you can't search your code for the method
* The method name is passed as a `Symbol`
* We use `*args` to get all the arguments as an `Array`
    * All arguments except a block (if one is passed in)
    * The `*` is called "splat"
* NOTE: The block isn't being used in this example
    * I just wanted to show the full method signature

---

# Object#respond_to_missing?

~~~ ruby
class X
  def method_missing(method_name, *args, &block)
    puts "Method called on an X: #{method_name}, args: #{args}" \
          if respond_to_missing?(method)
  end

  def respond_to_missing?(method_name, include_private=false)
    method_name =~ /^good_/
  end
end
X.new.respond_to?(:good_method)
X.new.respond_to?(:bad_method)
~~~

~~~ output
true
false
~~~

???

* Called when `respond_to?` is called, and the method is not defined
    * Before Ruby 1.9.2, we used to just override `respond_to?`
* Called when calling `method`
    * Example at http://stackoverflow.com/a/13793573
* Note that it takes a 2nd argument
    * Whether to include private methods
* Always define `respond_to_missing?` when overriding `method_missing`
* See a nice explanation at http://blog.marc-andre.ca/2010/11/15/methodmissing-politely/
* Yes, this is on `Object`, while `method_missing` is on `BasicObject`
    * Because `BasicObject` doesn't have `respond_to?`

---

# Module#const_missing

* Avoid this one
* Seems enticing, but leads to long-term problems
* Use `require` instead
    * Or maybe `autoload`

???

* Rails uses this to auto-load classes
    * Remember, class names are constants
* In general, it's not worth it
    * Just manually require the file containing the class/constant you need
* If you really want something like this, try registering with `autoload` instead
    * `autoload(:MyModule, "/usr/local/lib/modules/my_module.rb")`


---

# Inheritance Life-Cycle

* `included`
* `extended`
* `prepended`
* `inherited`

---

# Module#included

~~~ ruby
module A
  def self.included(other_module)
    puts "#{self} included in #{other_module}"
  end
end

class B
  include A
end
~~~

~~~ output
A included in B
~~~

???

* Note that it's `def self.included`
    * Because it's a method on the module itself
* Note that we don't need to new up a B
    * The `include` (and the `included` hook) runs as soon as we call it
    * TODO: Maybe in a next slide show how that works with normal code
* Called when this module is included in another module or class
* Called with the class or module that is including us
* NOTE: There's a similar hook called `append_features`
    * It adds constants, methods, and module variables of this module to module passed in
    * I know of no reason to use `append_features` over `included`
        * Unless you want to do something nefarious and NOT add constants/methods/variables

---

# Module#extended

~~~ ruby
module A
  def self.extended(other_module)
    puts "#{self} extended by #{other_module}"
  end
end

module B
  extend A
end
~~~

~~~ output
A extended by B
~~~

???

* Just like `included`
* Note that it's `def self.extended`

---

# Module#prepended

~~~ ruby
module A
  def self.prepended(other_module)
    puts "#{self} prepended in #{other_module}"
  end
end

class B
  prepend A
end
~~~

~~~ output
A prepended in B
~~~

???

* Ruby added `prepend` in 2.0
    * Basically the same as `include` but adds the module to the beginning of the inheritance chain
    * Used when `alias_method_chain` used to be used
    * See https://hashrocket.com/blog/posts/module-prepend-a-super-story for a good example
* Just like `included`
* Note that it's `def self.prepended`
    * Because it's a method on the module itself

---

# Class#inherited

~~~ ruby
class A
  def self.inherited(other_class)
    puts "#{self} subclassed by #{other_class}"
  end
end

class B < A
end
~~~

~~~ output
A subclassed in B
~~~

???

* Note that it's `def self.inherited`
    * Because it's a method on the class itself

---

# Method Life-Cycle

* `Module#method_added`
* `Module#method_removed`
* `Module#method_undefined`

???

* These are on `Module`
    * Because regular instance methods are defined in modules and classes
* You will probably find few good reasons to call `remove_method` or `undef_method`
    * See https://ruby-doc.org/core-2.3.0/Module.html#method-i-undef_method for docs
    * You can also call `undef method_name` instead of `undef_method :method_name`
* Removing a method will allow any superclass methods to still be called
    * Only example I can think of is if you dynamically added it
* Undefining a method will set the method to return a `NoMethodError`
    * Only example I can think of is if you're trying to look like an older Ruby


---

# Singleton Method Life-Cycle

* `BasicObject#singleton_method_added`
* `BasicObject#singleton_method_removed`
* `BasicObject#singleton_method_undefined`

???

* But you can also add methods to individual objects
    * These are called singleton methods
    * This is how you define a class method --- it's a singleton method on the class itself
* These are the equivalent for singleton methods

---
class: strict_conversion

# Implicit (Strict) Conversion Methods

* `to_str`
* `to_int`
* `to_ary`
* `to_hash`
* `to_proc`
* `to_enum`

???

* These are used to say something "is like" what it's converting to
    * Not just "can be shown as"
    * https://zverok.github.io/blog/2016-01-18-implicit-vs-expicit.html
* Most of these are used when trying to compare using `==`
    * If types are not the same, will try to convert the right side to the same type as the left
* `to_str` - used when concatenating strings
    * A UserName class might be a good place to define this
        * Because you want to be able to use it anywhere you use a String
* `to_ary` - assigning to multiple left-hand variables (or block arguments)
    * http://stackoverflow.com/questions/9467395/whats-the-difference-between-to-a-and-to-ary
* `to_int` - used when performing bit operations (`|`, `&`, `^`)
* `to_hash` - used to convert `method_name(**kwargs)`
* `to_proc` - called when trying to convert to a block using the `&` operator
* `to_enum` returns an Enumerator, not an Enumerable

---
class: strict_conversion_2

# Implicit Versus Explicit Conversion

* `to_str`
* `to_int`
* `to_ary`
* `to_hash`
* `to_proc`
* `to_enum`

* `to_s`
* `to_i`
* `to_a`
* `to_h`
* `&`

???

* Here are the explicit equivalents
* You almost always want to define the explicit versions
    * Think carefully before defining the implicit variants
* Important note: `to_s` is used in interpolation
    * So `to_s` could be considered *implicit* in that case
        * Even though it seems implicit to me
* Important note: `*x` calls `to_a(x)` (implicitly)
    * Once again, called an "explicit" conversion
    * I think this changed to `to_ary` in Ruby 2.0

---

# Numeric#coerce

* Find a common type for math with mixed types

~~~ ruby
class Quaternion
  def +(other)
    case other
    when Quaternion
      Quaternion.new(self.i + other.i)
    else
      Quaternion.new(self.i + other)
    end
  end
end
q1 = Quaternion.new(1)
puts 2 + q1
~~~

~~~ output
coerce.rb:18:in `+': Quaternion can't be coerced into Fixnum (TypeError)
~~~

???

* `coerce` helps find a common type when doing math on mixed types
    * `Numeric`, its subclasses, and similar things like `Matrix` and `Vector`
    * Binary operators
* Looks at `self` (the left-hand operand) and the other operand
    * Allows you to "cast" the operands into something compatible
* See http://stackoverflow.com/a/2799899

---

# Numeric#coerce

* Add `coerce` to fix the problem:

~~~ ruby
class Quaternion
  def coerce(other)
    puts "Quaternion#coerce called"
    [Quaternion.new(other), self]
  end
  def to_s
    "Quaternion(#{i})"
  end
end
q1 = Quaternion.new(1)
puts 2 + q1
~~~

~~~ output
Quaternion#coerce called
Quaternion(3)
~~~

???

* Note that `coerce` returns an `Array`, with `self` as the 2nd element

---

# Numeric#coerce

* Coercion transforms binary operators like this:

~~~ ruby
q1 = Quaternion.new(1)
n = 2
[q2, q1] = q1.coerce(n)
q1 + q2
~~~

???

* This only happens after trying without coercion

---

# Kernel#at_exit

* Sets a block or proc to run on program exit
* If `$!` is set, program is exiting due to an exception

~~~ ruby
at_exit do
  if $!
    puts "We crashed! #{$!.inspect}"
  else
    puts "fin"
  end
end
~~~

???

* `at_exit` sets a proc to be run on program exit
* If called multiple times, they're run in reverse order of registration
* Can check if `$!` is set to see if programming has crashed due to an exception
* NOTE: `$!` contains the last exception that was raised
    * We can convert it to a string or inspect it
    * If we `require "english"`, it's equivalent to $ERROR_INFO

---
class: thanks

# Thanks

![](get_the_hook.png)

???

* Thank YOU for coming
* Thanks to STL Ruby members for feedback on my first version

---

# Feedback

* Please talk to me in the hallway!


* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Slides: https://github.com/booch/presentations/

???

* Please talk to me in the hallway!
    * I'm introverted
    * I live people
    * I like talking to interesting people about interesting things
    * I like talking about interesting things
* Credits:
    * Clip art from Clipart.co



[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[boochtek]: http://boochtek.com
[binary_noggin]: http://binarynoggin.com/
[tal]: http://www.thisagilelife.com


[remark]: http://remarkjs.com/
