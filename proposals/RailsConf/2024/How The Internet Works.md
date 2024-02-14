# How The Internet Works

## Abstract / Description

When we think about the Internet, we think about the Web.
But that's just a small part of the bigger picture.

At its base, the Internet is about moving packets of data around.
We need established protocols to efficiently get that data where it needs to go.
DNS, routing, proxies, and security are all necessary to make your web apps work.
This will be a whirlwind tour of how that all happens.

## Bio

Craig has enjoyed using Ruby and Rails since 2005.
He champions continuous improvement in team processes, technical practices, and automation.

Ask Craig about traveling, beekeeping, classic rock, or where he was when the pandemic hit.


## Details

I plan to explore the various network layers, from the bottom up.
(I won't get into all the ISO layers; no time for that.)
I'll tell the story from the viewpoint of some data packets making the journey from a web browser to a web server and back.

* TCP/IP model
* Physical
    * Ethernet
    * WiFi
    * 5G
* IP
    * Addressing
    * Routing
    * IANA, ARIN
    * Subnets, CIDR
* DNS
    * Root servers
    * Name servers
    * Recursive resolvers
    * Alternative providers
    * Caching problems
* TCP
    * Ports
    * Connections
* HTTP
    * Headers
    * Body
    * Streams
* Security
    * TLS
    * Certificates
* Proxies
    * Speed
    * Caching
    * NAT

Given the time constraint, the idea isn't to teach the audience everything --
it's to provide an outline of what's going on, allowing them dig in more when they need to.


## Pitch

I've given similar talks at local users groups, but they were much longer and in depth.
I like to give these kinds of technical talks, going wide on a topic, but with some depth as well.

I intend this talk to be more of a story than my typical talks.
I haven't decided exactly how to tell that story,
but I'm thinking of it as an adventure that some data packets are taking together.

In a previous life, I was a network admin, maintaining firewalls at a Fortune 500 company.
One of my roles was troubleshooting network traffic as it was going through the firewalls.
Often this involved tracing packets, and understanding how the various protocols work.
