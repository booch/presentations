HTTP://Exploration
==================


Abstract
--------

We're web developers. But how well do we know the web's core protocol, HTTP? In this lab, we'll explore the protocol to see exactly what's going on between the browser and the web server.

We'll cover:

* HTTP basics
* HTTP methods (GET, POST, PUT, etc.)
* HTTPS
* Troubleshooting tools
* Proxies
* Caching
* HTTP/2

We'll investigate how we can take advantage of HTTP features to troubleshoot problems, and to improve the performance of our Rails apps.


Details
-------

I'll start by explaining the basics of the protocol, including URLs, HTTP methods, the request/response cycle, and headers.

We'll then start up a Rails app and use some tools to hit it:

* We'll use `telnet` to show how the raw data looks over the wire.
* We'll use cURL and HTTPie to explore how a few headers work.
* We'll work with a secure HTTPS connection using `openssl s_client`, and see how TLS works, including certificate info.

We'll then start a proxy to see how it affects traffic between the client and server. This can have major consequences for caching, so we'll take a look at how caching works, and what we can do to influence how our content gets cached. We'll explore headers like Cache-Control, ETags, If-Modified-Since, and Vary.

Finally, we'll take a quick peak at HTTP/2, which was just recently published.

I'll set up a Vagrant VM for everyone to use for hands-on exercises. This will help solve a few problems:
  * I won't have to figure out how to install everything on different OSes.
  * We won't spend too much time struggling to get everything installed.
  * We'll all be using the same versions of all the tools.
  * I can have apps, proxies, and data pre-loaded for each exercise.


Pitch
-----

I recently gave a similar 90-minute talk at the local Ruby users group. It was one of the best-attended talks in our 10-year history. I got a lot of good feedback on how to improve the presentation to make the information more interesting and more actionable.

I think this would work best as a 2-hour or 2.5-hour lab, but I could easily expand it to 3 hours.

In a previous life, I was a network admin, maintaining firewalls at a Fortune 500 company. One of my roles was troubleshooting traffic as it was going through the firewalls. Often this involved tracing HTTP packets, and understanding how the protocol and the web apps worked together.

I love speaking at local user groups. Last year I got to speak at a conference for the first time. I was very nervous at first, but loved the experience. I'm looking forward to my next chance to speak at a conference.


Bio
---

Craig is an independent consultant specializing in Ruby, Rails, Rails rescue projects, and Agile techniques. Craig started using Rails in late 2005, and found a home in the framework, the language, and the community.

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

