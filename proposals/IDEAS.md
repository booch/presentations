Talk Ideas
----------

* Extending Ruby
    * See Kevin Deisz's RubyConf 2017 talk
        * He extends Ruby
    * Functions taking multiple blocks, with named block arguments
        ~~~
        def if(condition, &then:, &else:=nil) ; ... ; end
        if 1 == 2, then: { puts "WTF?" }, else: { puts "Good" }
        if 1 == 2, then: do
          puts "WTF?"
        end, else: do
          puts "Good"
        end
        ~~~
    * First-class blocks
		* `my_block = { some stuff }`
		* `{ some stuff }.if(condition)`
		* Will require grammar changes to distinguish blocks from hashes
			* Look for `=>` or `:`, if not present, it's a blocks
            * Beware of `?` `:` in blocks
* Further Explorations into Connascence
    * Jim's example of old Rails `find(:first)` and `find(:all)` returning different types of results
        * `uniq` has a similar issue -- it doesn't run the block at all if there's only 1 element
            * I suppose that could be seen as a short-circuit though, like `&&` and `||` implement
    * How does DRY fit in?
    * How to SOLID principles fit in?
    * Does using methods to generate routes/URLs in Rails really help?
