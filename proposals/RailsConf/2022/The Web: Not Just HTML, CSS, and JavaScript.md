The Web: Not Just HTML, CSS, and JavaScript
=======

Type: workshop
Track: General


Abstract (public, 600 characters)
--------

When we think about the web, we think about HTML, CSS, and JavaScript.
But there's much more to the web than that!

We'll explore the different layers of Internet network traffic.
We'll dig in deep on HTTP, the language web servers and web browsers use to communicate.
We'll practice using several tools to troubleshoot web traffic.


Details (outlines, outcomes, intended audience, etc.)
-------

Intended Audience: Beginner, Intermediate

I plan to start with a brief introductory presentation:

* Network layers
    * ISO
    * TCP/IP
* DNS
* HTTP
    * HTTP/2
    * URLs
    * HTTP methods
    * request/response cycle
    * HTTP headers
* TLS
* Caching
* Authentication
* Load balancers
* Proxies
    * Transparent
    * Non-transparent
    * Reverse
* CSRF, XSS

We'll then start up a Rails app and use some tools to view HTTP connections to the server:

* ping
* nslookup, dig
* traceroute
* Curl, wget
* HTTPie
* OpenSSL s_client
* tcpdump, Wireshark
* Developer Tools in various browsers

We'll then start a proxy to see how it affects traffic between the client and server. This can have major consequences for caching, so we'll take a look at how caching works, and what we can do to influence how our content gets cached. We'll explore headers like Cache-Control, ETags, If-Modified-Since, and Vary.

Finally, we'll take a quick look at HTTP/2, and how it affects our tools.


Pitch (why this talk, why me?)
-----

I've given a similar workshop at several local meetups. They've gone over well with the audiences. I've also given a similar workshop at RailsConf 2015.

In a previous life, I was a network admin, maintaining firewalls at a Fortune 500 company. One of my roles was troubleshooting traffic as it was going through the firewalls. Often this involved tracing HTTP packets, and understanding how the protocol and the web apps worked together.



Bio
---

Craig has been using Ruby and Rails since 2005. He enjoys coding, and Ruby increases that enjoyment. In addition to development work, he specializes in helping teams improve the way they work — through technical practices, processes, and automation.

If you want to make small talk, ask Craig about attending concerts, traveling, canoeing, or beekeeping.


---



Other
-----

I'll probably work my way through the areas in the same order they're normally addressed in an Agile work flow:

* Stories
* Tests
* Classes
* Methods
* Commits
* Releases

* Sandi Metz' rules:
    * Classes can be no longer than one hundred lines of code
    * Methods can be no longer than five lines of code
    * Pass no more than four parameters into a method
    * Controllers can instantiate only one object
    * Break these rules only if you have a good reason and your pair lets you

Of course there are some exceptions to the rules, where smaller is not better:

* Documentation
* Commit messages