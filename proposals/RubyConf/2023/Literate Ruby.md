# PROPOSAL: Literate Ruby

## Abstract

Literate programming places commentary about the code in the primary position. The code itself is interspersed within prose descriptions.

How hard could it be to implement literate programming in Ruby? Can we just load all our code from Markdown code blocks? Let's find out!

We'll override Ruby's `require` method. Along the way, we'll learn more about how Ruby works, and why we should never override Ruby's `require` method.

## Details

I'll talk about how `require` is just a method in the Kernel module.

I'll cover the various ways of overriding a method, from aliasing to injecting a module. I'll explain the best practices and why they are the best options.

I'll tell the story about how I was using Markdown for some of my end-to-end tests, and wanted to write up my reasoning for the decisions I'm making in the code. I realized I could use the same pattern for Ruby code and hook into the `require` mechanism. I'll show the code I came up with, and how it works.

I'll probably get into `include` versus `extend` versus `prepend`, and metaclasses. I'll probably talk about refinements, even though they're not the right tool for this particular job.

I'll explore how my monkey patching (AKA duck punching) interacts with Rubygems' and Bundler's overriding of "require".

I'll admit that it would have been easier to just extract the Ruby code ahead of time with a rule in the Makefile or a Rakefile.

This talk will appeal to intermediate and advanced Rubyists.

## Pitch

This is a real-world example that I came up with to implement
a form of literate programming.
I wrote Markdown documentation that included code blocks,
a sort of [README-driven development](https://tom.preston-werner.com/2010/08/23/readme-driven-development.html).
The CI system then ran the code in the docs,
checking to make sure that the results were as documented.
I can leverage this story to show how `require` works,
as well as covering details of several other interesting aspects of Ruby.

I've been using Ruby and Rails since 2005.
I like to poke around at interesting features of programming languages
and standard libraries.
I've previously given conference talks that dug into Ruby idioms,
including some in-depth exploration of module inclusion.

This talk will be relatively code-heavy.
I'll have to work to keep it from being too dry.
I'm planning to get some help from "Instantly Better Presentations" by Damian Conway, among other resources.

## Resources

* http://ndlib.github.io/practices/responsible-overwriting-of-ruby-methods/
* http://blog.jayfields.com/2008/04/alternatives-for-redefining-methods.html?m=1
* [rubygems/kernel_require.rb at master · rubygems/rubygems · GitHub](https://github.com/rubygems/rubygems/blob/master/lib/rubygems/core_ext/kernel_require.rb)