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
* 50 Years of Ruby (RubyConf 2019 talk about Smalltalk)
    * Smalltalk project was started in 1969
    * Smalltalk was released in 1972
    * Smalltalk was released publicly in 1980
    * Talk about the environment at the time at Xerox PARC
    * Talk about Alan Kay
    * Get into Simula a bit
    * Smalltalk-72 apparently had a much different syntax than Smalltalk-76 and -80
    * Pull ideas from (and reference) Avi Bryant's keynote from RailsConf 2008
    * Mention that IDEs, GUIs, and WYSIWYG originate with basically the same team
    * Mention MVC pattern (and how web MVC is different from GUI MVC)
    * Blocks are what distinguish the 2 languages from others
