HTTP://Exploration
==================


Description
-----------

This hands-on tutorial will explore the HTTP protocol, in order to help troubleshoot problems and improve the performance of web apps.


Abstract
--------

Are you a web developer? How well do you know the web's core protocol, HTTP? In this hands-on tutorial, we'll explore the protocol to see exactly what's going on between the browser and the web server. We'll start with the basics, then take a look at security, proxies, and caching.

We'll explore several tools to see HTTP requests and responses. Telnet will show us the raw data being transmitted. cURL and HTTPie will help us work with headers and body content. OpenSSL's s_client will show us how a secure HTTPS connection works.

We'll then start a proxy to see how it affects traffic between the client and server. This can have major consequences for caching, so we'll take a look at how caching works, and what we can do to influence how our content gets cached. We'll explore headers like Cache-Control, ETag, If-Modified-Since, and Vary, and see how we can use them to improve the performance of our web apps.


Prerequisites
-------------

Attendees should have a basic understanding of the Internet -- enough to understand the difference between the Web and the Internet. They should be able to install software on their computers, and not afraid to use the command line.


Tutorial prerequisites
----------------------

You'll need to have Vagrant and VirtualBox installed and working properly. A virtual machine image that includes all the tools we'll be using will be provided.


Additional Notes 
----------------

I recently gave a similar 90-minute talk at a local users group. It was one of the best-attended talks in our 10-year history. I got a lot of good feedback on how to improve the presentation to make the information more interesting and more actionable. I'd really like to give a more hands-on variant of that talk.





In a previous life, I was a network admin, maintaining firewalls at a Fortune 500 company. One of my roles was troubleshooting traffic as it was going through the firewalls. Often this involved tracing HTTP packets, and understanding how the protocol and the web apps worked together.

I love speaking at local user groups. Last year I got to speak at a conference for the first time. I was very nervous at first, but loved the experience. I'm looking forward to my next chance to speak at a conference.


Bio
---

Craig Buchek is an independent consultant specializing in Ruby, Rails, Rails rescue projects, and Agile techniques. Craig has been using GNU/Linux and other open source software since 1994.

When he's not coding, reading about coding, or thinking about coding, Craig enjoys canoeing, attending concerts, watching Cardinals baseball, and traveling.


Work to Do
----------

* Humor
* Pictures
  * Client -> Proxy -> Reverse Proxy -> Server
  * Diagram of URI breakdown
  * OSI diagram, showing telnet (transport) and HTTP (application) layers
* Do better at switching between presentation and demo
* HTTpie
* Script out the commands and data better
  * Especially for the telnet examples
* Benchmarking tools
* Browser network information panel
  * Especially differences between HTTP/1.1 and HTTP/2

