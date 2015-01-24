class: title, middle, center

How The Web Works - HTTP
========================

* Everything You (Never) Ever Wanted to Know About HTTP


* by Craig Buchek
* STL Ruby
* January 26, 2015


---

Feedback
========

* Twitter: @CraigBuchek
* GitHub: booch (personal, presentations)
* GitHub: boochtek (projects)
* Email: craig@boochtek.com

* Please feel free to ask questions during the presentation


---

About Me
========

* Independent web developer
  * BoochTek
  * Binary Noggin
  * Mercy
* Ruby / Rails user since 2006
* Agile practitioner / podcaster


---

Agenda
======

* HTTP Basics
* URL vs URI
* HTTP methods (GET, POST, PUT, ...)
* HTTPS
* Proxies
* Caching
* REST
* HTTP/2


---

HTTP Basics
===========

* Stateless
* Text-based
* Request / Response
* Headers
* Body


---

HTTP History
============

* HTTP/0.9 (1991)
* HTTP/1.0 (1996)
  * RFC 1945
* HTTP/1.1 (2007)
  * RFC 2616
* HTTP/1.1 updates (2014)
  * RFCs 7230, 7231, 7232, 7233, 7234, 7235
* HTTP/2.0 (2015)
  * http://http2.github.io/


---

URLs
====

* RFC 3986
* URL versus URI
  * URL - provide a means of locating the resource by describing its primary access mechanism
    * Used to *access* the resource
  * URI - identifies a resource
    * Used for identifiers without going to get the resource
  * URN - non-network resource hierarchy
  * IRI (International Resource Identifiers) - the extension of URI syntax to non-ASCII
* Scheme (protocol)
* Server
* Port
* Path
* Query string
* Fragment

???

* URN example: ISBN number for a specific edition of a book
  * urn:isbn:0-486-27557-4
* More URL examples:
  * urn:ietf:rfc:2648
  * urn:uuid:6e8bc430-9c3a-11d9-9669-0800200c9a66
  * urn:oid:1.3.6.1.4.1.9954 (BoochTek's Private Enterprise Number (PEN) registered with the IANA)
    * Used for SNMP MIBs, LDAP, DHCP options, and other places
* All URLs are URIs (with some possible caveats)
* Not all URIs are URLs
* All URNs are URIs
* An example of a URI that's not a URL is the "system identifier" portion of an HTML/SGML DOCTYPE
  * For example http://www.w3.org/TR/html4/strict.dtd
    * Although this particular one DOES have content at that URL
* Another example is an XML namespace
  * TODO: Show an example (preferably one that has no content at the URL)
* TODO: Show an example of a URI with the sections shown


---

HTTP Methods
============

* GET
* HEAD
* POST
* PUT
* DELETE
* OPTIONS
* TRACE
* PATCH
* WebDAV additions
* Safety, idempotency


---

HTTP Request
============

* URL
* Headers
* Body


---

HTTP Response
=============

* Status code
* Headers
* Body


---

Request Headers
===============

* Host
* Accept
* Accept-Encoding
* Authorization
* Connection
* Cookie
* Content-Length
* Content-Type
* Referer
* User-Agent
* X-Forwarded-For


---

Response Status Codes
=====================

* 100s - Informational
* 200s - Success
  * 200 - OK
  * 201 - Created
* 300s - Redirection
  * 301 - Moved Permanently
  * 304 - Not Modified
* 400s - Client Error
  * 401 - Unauthorized
  * 403 - Forbidden
  * 404 - Not Found
  * 407 - Proxy Authentication Required
* 500s - Server Error
  * 500 - Internal Server Error
  * 502 - Bad Gateway
  * 504 - Gateway Timeout


---

Response Headers
================

* Content-Encoding
* Content-Length
* Content-Disposition
* Content-Type
* Location
* Set-Cookie
* WWW-Authenticate


---

HTTPS
=====

* SSL
* TLS
* openssl s_client
* curl / wget


---

Proxies
=======

* Headers
  * Proxy-Authenticate
  * Proxy-Authorization
  * Via


---

Caching
=======

* Forward versus reverse proxies
* Transparent proxies
* Headers
  * Cache-Control
  * If-Modified-Since
  * If-None-Match
  * ETag
  * Vary


---

CDNs
====

* Content delivery network
* Caching proxies for static content
* Content is distributed
* Content is placed closer to more clients
* BGP Anycast for DNS servers
  * Determines which content server is closest

* DoS protection


---

REST
====

* Representational State Transfer
* Simpler alternative to SOAP and WS-* web services
* Architecture style
* Use standard HTTP methods to perform all operations
  * And more imprtantly, the meanings of those methods
  * And URLs to represent resources
* Media types (often JSON or XML) to represent resources
* HATEOAS
  * Follow hyperlinks within resource representations
  * Instead of constructing URLs because you know the API

* REST - Use HTTP methods like they're meant to be used
* HATEOAS - Use HTTP documents like HTML documents 


---

HTTP/2
======

* SPDY
* Header compression (HPACK)
* TLS
  * Not related, but required by every implementation
    * Probably due to application protocol negotiation TLS feature
* Binary framing instead of text-based
  * Same semantics as HTTP/1.1 though
* Multiplexed connections
  * Grab multiple resources simultaneously
    * Over a single TCP connection
* Server push
* Removes the need to combine JS, CSS, and images
* Starts with an HTTP/1.1 connection using `Upgrade` and `HTTP2-Settings` headers
  * Returns a 101 status code (Switching Protocols)

???

* Nginx will support it very soon after the RFC is published
  * 1.5.10 supports SPDY/3.1
* Apache seems to have no plans, but mod_spdy is available
* Chrome support is enabled with `--enable-spdy4` or via `chrome://flags`
* Firefox (34) support is enabled with `network.http.spdy.enabled.http2draft`
  * Has supported SPDY since version 15
* IE 11 will support HTTP/2


---

Feedback
========

* Twitter: @CraigBuchek
* GitHub: booch
* Email: craig@boochtek.com

???

brew install nginx --with-spdy --with-gunzip --with-debug
# Docroot: /usr/local/var/www
# Config: /usr/local/etc/nginx/nginx.conf
nginx

brew install varnish
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.varnish.plist

brew install privoxy
privoxy /usr/local/etc/privoxy/config

brew install squid
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.squid.plist

brew install polipo
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.polipo.plist

