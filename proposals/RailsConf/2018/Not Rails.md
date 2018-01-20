Framework != Rails
==================

Abstract
--------

We all love Rails.
We're at a Rails conference, after all.
But is Rails always the right choice?
Let's take a brief look at some alternatives:

* Hanami
* Sinatra / Padrino
* Trailblazer
* Roda
* Grape
* Phoenix (Elixir)
* Kemal (Crystal)

What are the pros and cons of each?
When should we consider each of these alternatives?


Details
-------

This will obviously be a whirlwind tour, with only about 5 minutes per framework.
I'll focus primarily on the differences from Rails.
A few examples:

* Grape is good for API micro-services
* Phoenix and Kemal are highly performant
    * Response times are often measured in microseconds
    * Elixir takes some time to learn
    * Crystal only takes a little time to learn
* Trailblazer builds upon Rails or Hanami
    * Service objects (operations)
    * Validation objects
    * Policy objects
* Roda is based on a routing tree
    * Faster than Sinatra
    * Everything else comes from plugins
* Hanami is built using the Clean Architecture pattern
    * Apps are built around interactors, which perform the business logic
        * A CLI and a web app can be built from the same set of interactors
    * Entities and repositories are separated
* Padrino is a loose collection of tools to use atop Sinatra

I'll also very briefly mention other web frameworks in other, unrelated languages:

* Lift (Scala)
* Spring Boot (Java)
* Play (Java, Scala)
* Express (JavaScript)
* Django (Python)
* Laravel (PHP)
* Grails (Groovy)

For each of those, I'll likely just show 1 neat feature, and mention 1 reason you might consider it.
(Usually that's due to language constraints the team or company imposes.)

I won't really get into any client-side frameworks, due to time, but also due to the fact that they need back-end API services.


Pitch
-----

I'd like to expose people to the alternatives.
While Rails is the 800-pound gorilla, the other players also have their place.
Perhaps more importantly, I want to expose people to ideas in other frameworks that don't exist in Rails.

As a practical matter, it's also good to know the available options,
so you can make an educated choice when one of the other options is more ideal in a given situation.

I've used several of the alternatives, and investigated most of the others.
Being selected to give this presentation would give me the excuse I need to explore all the frameworks in some more depth.


Bio
---

Craig has been using Ruby and Rails since 2005. He enjoys coding, and Ruby increases that enjoyment.
In addition to development work, he specializes in helping teams improve the way they work —
through technical practices, processes, and automation.

When he's not coding, Craig enjoys attending concerts, traveling, canoeing, and beekeeping.
