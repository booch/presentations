# TALK IDEA: How the Web Works

## Talk Title

* How the Web Works
* How does the Web work?
* Maybe "The Web: Everything Besides HTML, CSS, and JavaScript"
* Maybe "The Web, minus HTML, CSS, and JavaScript"


## Abstract

When we think about the Web, we think about HTML, CSS, and JavaScript.
But there's much more to it than that!

We'll explore the different layers of Internet network traffic.
We'll dig in deep on HTTP, the language web servers and web browsers use to communicate.
We'll practice using several tools to view and troubleshoot network traffic between our Rails server and the browser.


## Bio

Craig has enjoyed using Ruby and Rails since 2005.
He champions continuous improvement in team processes, technical practices, and automation.

Ask Craig about traveling, beekeeping, classic rock, or where he was when the pandemic hit.


## Details

I plan to start with a brief introductory presentation:

* DNS
* HTTP, including HTTP/2
    * Request / Response
    * Headers
* TLS
* Caching
* Secure cookies
* Web sockets
* CORS (Cross-Origin Resource Sharing)
    * Access-Control-Allow-Origin, etc.
* CSP (Content Security Policy)
* HTST (HTTP Strict Transport Security)
* Certificate pinning
* Authentication
* Load balancers
* Proxies
    * Transparent
    * Non-transparent
    * Reverse
* CSRF, XSS

Then I'll have attendees access a Rails app that will echo the HTTP request back to the client,
so they can more clearly understand what the traffic looks like.
I'll guide them through the use of several tools to troubleshoot, including:

* ping
* traceroute
* nslookup, dig
* Curl, wget
* HTTPie
* OpenSSL s_client
* tcpdump, Wireshark
* Developer Tools in various browsers

I'll also have a proxy to add to the mix, to show how it affects traffic between the client and server.
This can have major consequences for caching, so we'll take a look at how caching works,
and what we can do to influence how our content gets cached.
We'll explore headers like Cache-Control, ETags, If-Modified-Since, and Vary.


## Pitch

I've given a similar workshop at several local meetups.
They've gone over well with the audiences.
I've also given a similar workshop at RailsConf 2015.
A lot has changed since then, so this time will be mostly new content.
For example, I'll cover CSP, CORS, and certificate pinning.

In a previous life, I was a network admin, maintaining firewalls at a Fortune 500 company.
One of my roles was troubleshooting traffic as it was going through the firewalls.
Often this involved tracing HTTP packets, and understanding how the protocol
and the web apps worked together.

The exercises will be mostly self-paced.
I'll encourage attendees to pair up to work together on the exercises.
