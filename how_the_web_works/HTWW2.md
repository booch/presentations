class: title, middle, center

How The Web Works - Part 2
==========================

* Everything You (Never) Ever Wanted to Know About The Web

* by Craig Buchek
* STLLUG
* March 19, 2015

---

Feedback
========

* Twitter: @CraigBuchek
* GitHub: booch (personal, presentations)
* GitHub: boochtek (projects)
* Email: craig@boochtek.com

* This Presentation Series: http://bit.do/htww

* Please ask questions during the presentation
  * We can explore things more in depth, as required

---

About Me
========

* Independent web developer
  * BoochTek
  * Binary Noggin
  * Mercy
* Ruby / Rails programmer since 2006
* Agile practitioner
  * This Agile Life podcast

---

About Me
========

* You may remember me from presentations such as:
  * [Everything You Ever Wanted to Know About Hard Drives][eyewtkahd]
  * [Everything You Ever Wanted to Know About HDTV][eyewtkahdtv]
  * Compiling a Linux Kernel

[eyewtkahd]: http://craigbuchek.com/presentations/2006-06-14/HardDrives.html
[eyewtkahdtv]: http://craigbuchek.com/presentations/2007-07-19/hdtv.html

---

Agenda
======

* Overview
* URLs
* HTTP Basics
* HTTP methods (GET, POST, PUT, ...)
* HTTPS
* Proxies
* Caching
* HTTP/2

---

How Does the Browser Talk to the Server?
========================================

* URL is interpretted and broken into pieces
* Web server is determined
* Name of web server is looked up
  * DNS query / resolution
* Browser communicates with server via HTTP

---

URLs
====

* RFC 3986
* Describes "where" a page "is"
* Describes how a page can be retrieved

---

URL versus URI
==============

* URL - provide a means of locating the resource by describing its primary access mechanism
  * Used to *access* the resource
* URI - identifies a resource
  * Used for identifiers without going to get the resource

* All URLs are URIs (with some possible caveats)
* Not all URIs are URLs

* URN - non-network resource hierarchy

???

* URN example: ISBN number for a specific edition of a book
  * urn:isbn:0-486-27557-4
* More URL examples:
  * urn:ietf:rfc:2648
  * urn:uuid:6e8bc430-9c3a-11d9-9669-0800200c9a66
  * urn:oid:1.3.6.1.4.1.9954 (BoochTek's Private Enterprise Number (PEN) registered with the IANA)
    * Used for SNMP MIBs, LDAP, DHCP options, and other places
* All URNs are URIs
* An example of a URI that's not a URL is the "system identifier" portion of an HTML/SGML DOCTYPE
  * For example http://www.w3.org/TR/html4/strict.dtd
    * Although this particular one DOES have content at that URL
* Another example is an XML namespace
  * TODO: Show an example (preferably one that has no content at the URL)

---

International URIs
==================

* IRI (International Resource Identifiers)
* Extension of URI syntax to non-ASCII
* PunyCode

---

URL Components
==============

~~~
http://user:pword@example.com:8080/abc/index.php?type=prod&name=cd#price
\__/   \________/ \_________/ \__/\____________/\________________/\____/
  |        |           |       |       |                |           |
  |     userinfo      host    port    path            query      fragment
  |    \_________________________/
scheme            |
              authority
~~~

* Scheme (protocol)
* Host (server)
* Port
* Path
* Query string
* Fragment

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

HTTP Request
============

* URL
* Headers
* Body

???

* `telnet localhost 3000`
* HTTP/0.9
  * `GET http://localhost/`
* HTTP/1.0
  * `GET / HTTP/1.0`
  * `Host: localhost`
* HTTP/1.1 (notice the `Connection: Keep-Alive` by default)
  * `GET / HTTP/1.1`
  * `Host: localhost`


---

HTTP Response
=============

* Status code
* Headers
* Body

???

* `curl -v http://localhost:3000/`
* `brew reinstall wget --with-debug`
* `wget -d http://localhost:3000/`


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

???

* Modify the controller action:
  * `request_headers = request.headers.map{|k,v| "#{k}: #{v}"}.join("\n")`
  * `render text: "<h1>Hello, World!</h1><pre><code>#{request_headers}</code></pre>".html_safe`


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

???

* Modify the controller action, and look at results in `curl`, browser, and `wget`:
  * `headers["foo"] = "*** bar ***"`
  * `headers["Location"] = "https://google.com/"; render text: "", status: 302`
  * `redirect_to "https://google.com/"`


---

HTTPS
=====

* SSL
* TLS
* openssl s_client
* curl / wget

???

* `openssl s_client -connect google.com:443`
  * `GET / HTTP/1.0`
  * `Host: www.google.com`


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

Credits
=======

* Wikipedia
  * URL example: http://en.wikipedia.org/wiki/URI_scheme#Examples
* Charlie Sanders for feedback
* Background image: http://www.demilked.com/free-grunge-textures-backgrounds/

---

Further Info
============

* [What Happens When][whw]

[whw]: https://github.com/alex/what-happens-when

---

Feedback
========

* Twitter: @CraigBuchek
* GitHub: booch
* Email: craig@boochtek.com

* This Presentation Series: http://bit.do/htww
