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
