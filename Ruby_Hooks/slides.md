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

---

class: title, middle, center

# What Is a Hook?

???

* Called implicitly
    * "spooky action at a distance"
    * Can be surprising
* "Ruby calls"
    * Sometimes used in Ruby-Doc site
* Sometimes called "callbacks"
    * But that has more meanings

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
* When you call `new` on a class, Ruby calls `allocate`
    * Ruby then calls `initialize` on the object that was just allocated
* Documentation implies this should only work for `Object`, not `BasicObject`
    * It says that `BasicObject.new` does nothing and returns `nil`
    * But `BasicObject` is a `Class`, so `BasicObject.new` calls `Class#new`
    * I've proven that a BasicObject instance *does* run `initialize`:

~~~
class BasicObject
  def initialize
    ::Kernel::puts "initializing a BO"
  end
end
bo = BasicObject.new
~~~

~~~ output
initializing a BO
~~~

---

# Meta-Programming Basics

* `method_missing`
* `respond_to_missing?`

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

* Note that we use `*args` to get all the arguments as an Array
    * Except a block, if it's passed
* I didn't show using the block here, just how to receive it


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
* `BasicObject#singleton_method_added`
* `BasicObject#singleton_method_removed`
* `BasicObject#singleton_method_undefined`

???

* The first 3 are on `Method`, because regular instance methods are defined in modules and classes
* But you can also add methods to individual objects
    * These are called singleton methods
    * This is how you define a class method --- it's a singleton method on the class itself
* You will probably find few good reasons to call `remove_method` or `undef_method`
    * See https://ruby-doc.org/core-2.3.0/Module.html#method-i-undef_method for docs
    * Removing a method will allow any superclass methods to still be called
    * Undefining a method will set the method to return a `NoMethodError`

---

# Implicit (strict) conversion methods

* `to_str`
* `to_int`
* `to_ary`
* `to_hash`
* `to_enum`
* `to_proc`

???

* These are used to say something "is like" what it's converting to
    * Not just "can be shown as"
    * https://zverok.github.io/blog/2016-01-18-implicit-vs-expicit.html
* Most of these are used when trying to compare using `==`
    * If types are not the same, will try to convert the right side to the same type as the left
* `to_str` - used when concatenating strings
    * But note that `to_s` is used in interpolation
        * So `to_s` could be considered implicit in that case
* `to_proc` - called when trying to convert to a block using the `&` operator
* `to_ary` - assigning to multiple left-hand variables (or block arguments)
    * http://stackoverflow.com/questions/9467395/whats-the-difference-between-to-a-and-to-ary
    * But `*x` calls `to_a(x)` (implicitly, but called an "explicit" conversion)
        * I think this changed to `to_ary` om Ruby 2.0
* `to_int` - used when performing bit operations (`|`, `&`, `^`)
* `to_hash` - used to convert `method_name(**kwargs)`
* `to_enum` returns an Enumerator, not an Enumerable

---

# Others

* `Kernel#at_exit`
* `Numeric#coerce`

???

* `at_exit` sets a proc to be run on program exit
    * Can check if `$!` is set to see if programming has crashed due to an exception
* `coerce` helps find a common type when doing math on mixed types
    * Looks at `self` (the left-hand operand) and the other operand
        * Allows you to "cast" the operands into something compatible
    * See http://stackoverflow.com/a/2799899
    * Will happen in you try to multiply a FixNum with your own class
        * Or several other numeric classes
        * `x = 1; y = MyNum.new(2); x * y` will call `y.coerce(x)`
        * `NyNum#coerce(x)` will return `[self, z = MyNum.new(x)]`
        * Ruby will then call `z.*(y)`


---
class: affiliations

# Affiliations

* ![](craigbuchek.png) [BoochTek][boochtek]
* ![](binary_noggin.png) [Binary Noggin][binary_noggin]
* ![](this_agile_life.jpg) [This Agile Life][tal]

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

---

# Feedback

* Please talk to me in the hallway!


* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Slides: https://github.com/booch/presentations/

???

* Please talk to me in the hallway!




[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[boochtek]: http://boochtek.com
[binary_noggin]: http://binarynoggin.com/
[tal]: http://www.thisagilelife.com


[remark]: http://remarkjs.com/
