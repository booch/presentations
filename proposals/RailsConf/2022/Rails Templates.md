Rails Application Templates
===========================


Abstract
--------

Do you have some gems that you always add when you create a new Rails project?
Do you pull in some assets? Add initializers? Configure your testing framework?

Why not use a Rails application template to do all that for you?
Application templates automate the process of getting started with your app.
You might think of them as keeping all your Rails "best practices" in one place.
Let's explore how we can use them to make using Rails even easier.


Details
-------

I'll cover the application template (Thor) DSL in some detail,
based on my own application templates.
This will include:

* adding gems
* adding files
* modifying files
* running git commands
* running arbitrary commands

I'll also show that the templates have the full power of Ruby.


Pitch
-----

I've maintained a Rails template for myself for many years.
While I don't start a ton of Rails apps, I've found it really helpful --
especially when participating in hackathons.

Recently, I realized that I could actually divide up my big monolithic template into smaller pieces.
So I can start with a more basic app, and add pieces as needed, for things like authentication,
different ORM options, or special-purpose JavaScript libraries.
