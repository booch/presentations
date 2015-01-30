HTTP://Exploration
==================


Abstract
--------

We're web developers. But how well do we know the web's core protocol, HTTP?
In this lab, we'll explore the protocol, using browser tools and command-line tools
to see what's going on between the browser and the web server.

We'll investigate how we can take advantage of HTTP features to make our Rails apps faster.

We'll cover:

* HTTP basics
* HTTP methods (GET, POST, PUT, etc.)
* HTTPS
* Troubleshooting tools
* REST
* Proxies
* Caching
* HTTP/2


Details
-------

The goal of this lab is to help people understand HTTP better, so they can troubleshoot problems and improve the performance of their Rails apps.

I'll start by explaining the basics of the protocol, including URLs, HTTP methods, the request/response cycle, and headers.

We'll then start up a Rails app and use some tools to hit it:

* We'll use `telnet` to show how the raw data looks over the wire.
* We'll use cURL and HTTPie to explore how a few headers work.
* We'll work with a secure HTTPS connection using `openssl s_client`, and see how TLS works, including certificate info.

We'll then start a proxy to see how it affects traffic between the client and server.
The proxy can also be used to observe the traffic.

This can have major consequences for caching, so we'll take a look at how caching works,
and what we can do to influence how our content gets cached.

Finally, we'll take a quick peak at HTTP/2, which was just recently published.


Pitch
-----

I recently gave a similar 90-minute talk at the local Ruby users group.
It was one of the best-attended talks in our 10-year history.
I got a lot of good feedback on how to improve the presentation to make
the information more interesting and more actionable.

I think this would work best as a 2-hour lab, but I could easily expand it
to 2.5 or 3 hours.

In a previous life, I was a network admin, maintaining firewalls at a Fortune 500 company.
One of my roles was troubleshooting traffic as it was going through the firewalls.
Often this involved tracing HTTP packets, and understanding how the protocol and the web apps worked together.

I love speaking at local user groups.
Last year I got to speak at a conference for the first time.
I was very nervous at first, but loved the experience.
I'm looking forward to my next chance to speak at a conference.


Work to Do
----------

* Humor
* Pictures
  * Client -> Proxy -> Reverse Proxy -> Server
  * Diagram of URI breakdown
* HTTpie
* Script out the commands and data better
  * Especially for the telnet examples
* Do better at switching between presentation and demo

