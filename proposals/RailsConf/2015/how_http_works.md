HTTP://Exploration
==================


Abstract
--------

We're web developers. But how well do we know the web's core protocol, HTTP?
In this presentation, we'll explore the protocol, with a goal of a better understanding
so that we can more effectively deal with authentication, caching, and REST services.

We'll cover:

* HTTP basics
* HTTP methods (GET, POST, PUT, etc.)
* HTTPS
* REST
* Proxies
* Caching
* HTTP/2


Details
-------

I plan to show how HTTP works by using tools like `telnet`, `curl`, `openssl s_client`, WireShark, and
the browser developer tools to hit the protocol at the lowest layers.
We'll be able to see what's going across the wire:
URIs, headers, methods (verbs), request and response bodies, etc.

We'll also take a look at how proxies work -- possibly changing the content of your traffic in the middle.
This can have major consequences for caching, so we'll take a look at how caching works,
and what we can do to influence how our content gets cached.

Finally, we'll take a peak at HTTP/2, which was just recently published.


Pitch
-----

I've given this as a 45-minute presentation at the local Ruby users group.
I've also given an unabridged (2-part, over 3 hours total) version at the local LUG,
with lots of interaction with the audience.
So I think this would work best as a 2-hour lab, but I could extend that as long as 3 hours, compress it to 90 minutes, or do it as a 45-minute standard talk.

In a previous life, I was a network admin, maintaining firewalls at a Fortune 500 company.
One of my roles was troubleshooting traffic as it was going through the firewalls.
Often this involved tracing HTTP packets, and understanding how the protocol and the web apps worked together.

I love speaking at local user groups.
Last year I got to speak at a conference for the first time.
I was very nervous at first, but loved the experience.
I'm looking forward to my next chance to speak at a conference.
