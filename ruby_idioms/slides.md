Ruby Idioms You're Not Using Yet
================================

# Craig Buchek #

# RubyConf 2014 #

---

Follow Along
============

http://craigbuchek.com/presentations/ruby_idioms

---

Feedback
========

# Twitter: CraigBuchek #
# GitHub: booch #

---

What Is An Idiom?
=================

1. an expression that cannot be understood from the meanings of its separate words but that has a separate meaning of its own

---

What Is An Idiom?
=================

2. a form of a language that is spoken in a particular area and that uses some of its own words, grammar, and pronunciations

---

What Is An Idiom?
=================

3. a style or form of expression that is characteristic of a particular person, type of art, etc.

---

What Is An Idiom?
=================

The way we normally do things.

---

Non-Idiomatic Ruby
==================

~~~ ruby
for i in 1..5
  puts "Craig is great"
end
~~~

---

Idiomatic Ruby
==============

~~~ ruby
(1..5).each do
  puts "Craig is great at Ruby"
end
~~~

---

Idiom Or Pattern?
=================

What's the difference?

---

Pattern
=======

A template for a common solution to a common problem

---

Module Factory
==============

First, a story of discovery

---

Module Factory
==============

~~~ ruby
class User
  include MyORM::Model
  table 'people'
end
~~~

Isn't `table` more like an option to the module being included?

---

Module Factory
==============

This isn't valid Ruby:

~~~ ruby
class User
  include MyORM::Model, table: 'people'
end
~~~

---

Module Factory
==============

Then I saw Virtus do this:

~~~ ruby
class User
  include Virtus.model(constructor: false, mass_assignment: false)
end
~~~

---

Module Factory
==============

Uses the Factory Pattern to create a module, and add methods to it at runtime

---

Module Factory
==============

I've used other names for this one:
  - Parameterized Module Inclusion

---

Configuration Query
===================

Ask a question about the configuration

---

Configuration Query
===================

~~~ ruby
ExtraLogging.for_applicant?(applicant_id)
~~~

---

Configuration Query
===================

~~~ ruby
class ExtraLogging
  def self.for_applicant?(applicant_id)
    applicant_ids.include?(applicant_id.to_s)
  end

  def self.applicant_ids
    @applicant_ids ||= config.fetch('applicant_ids'){[]}.map(&:to_s)
  end

  def self.config
    @config ||= YAML.load_file(CONFIG_FILENAME)
  end

  def self.reload
    @applicant_ids = nil
    @config = nil
  end
end
~~~

---

Tag Module
==========

TODO

---

Allow Class or Instance
=======================

~~~ ruby
date1 = Date.new(2014, 11, 17)
date2 = Date.new(2014, 11, 17, Date::Calendar::Julian)
first_julian = Date.new(Int64::MIN, Date::Calendar::Julian)
first_gregorian = Date.new(1752, 9, 14, Date::Calendar::Gregorian)
default_calendar = Date::Calendar::Multiple.new(first_julian, first_gregorian)
date3 = Date.new(2014, 11, 17, default_calendar)
~~~

---

Allow Class or Instance
=======================

~~~ ruby
class Date
  def initialize(year, month, day, calendar = Date::Calendar.default)
    calendar = calendar.new if Calendar.is_a?(Class)
    ...
  end
end
~~~

---

Fetch with Default Block
========================

~~~ ruby
RUBY_VERSION_REQUESTED = ENV["RUBY_VERSION"] || "2.1.4"
RUBY_VERSION_REQUESTED = ENV.fetch("RUBY_VERSION") { "2.1.4" }
~~~

---

---

Conclusion
==========

Our idioms are not static

---

Conclusion
==========

Be on the lookout for new idioms

---

References
==========


