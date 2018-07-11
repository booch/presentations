class: title, middle, center

# http://exploration

* by Craig Buchek

* Saint Louis Full Stack Web Development
* July 11, 2018


---

Feedback
========

* Twitter: @CraigBuchek
* GitHub: booch (personal, presentations)
* GitHub: boochtek (projects, workshop)
* Email: craig@boochtek.com

---

Follow Along
============

https://http-workshop.boochtek.com/slides

---

About Me
========

* Ruby / Rails programmer since 2006
* Network and System Admin before that
* HTML since 1995
* Boring slide designer

---

Agenda
======

* HTTP basics
* Requests
* HTTP methods (GET, POST, PUT, etc.)
* Responses
* Proxies
* Troubleshooting
* HTTP/2
* Exercises

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
* HTTP/2 (2015)
    * RFCs 7540, 7541

---

HTTP Basics
===========

* Stateless
* Text-based
* Request / Response

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

???

* Note that most of these are not required.

---
class: http-request

HTTP Request
============

<pre><code>
<span class="method">PUT</span> <span class="url_path">https://www.google.com/</span> HTTP/1.1
<span class="headers">Host: google.com</span>
<span class="headers">Content-Length: 38</span>
<span class="blank"> </span>
<span class="body">Haha, I've updated Google's home page!</span>
</code></pre>

<ul>
  <li><span class="method">Method</span></li>
  <li><span class="url_path">URL path</span></li>
  <li><span class="headers">Headers</span></li>
  <li><span class="body">Body</span></li>
</ul>

???

* Request line - contains the method, URL path, and protocol

---

HTTP Methods
============

* GET
* POST
* PUT
* DELETE
* HEAD

???

* Sometimes called "verbs"
* There are a few other methods
    * OPTIONS
    * TRACE
    * CONNECT
* There are also some extensions to HTTP that add methods
    * PATCH - RFC 5789
    * WebDAV - RFCs 2518, 4918, and many more
* Note that proxies/firewalls might restrict methods you can use

---

Safe Methods
============

* Do not have any effect on information
* GET, HEAD

???

* Takeaway = Don't have your app change things when processing `GET` requests.
    * Except logging and such.

---

Idempotent Methods
==================

* Can call multiple times without any additional effect
* GET, HEAD, PUT, DELETE

???

* Takeaway = Don't POST the same thing multiple times.

---

Request Headers
===============

* Host
* Accept
* Content-Length
* Content-Type
* Referer
* User-Agent

???

* Host - the only *required* header (except pre-HTTP/1.0)
* Accept - lists content types that the browser would like
    * Can specify relative quality factor for each type
* Content-Length - size of the body (if applicable -- POST and PUT)
* Content-Type - MIME type of body
    * Forms: Usually `application/x-www-form-urlencoded` or `multipart/form-data`
    * APIs: Typically `application/json` or `text/xml`
* Referer (spelled incorrectly) - page with link the user clicked
* User-Agent - string describing browser (or other HTTP client)

---

Request Headers
===============

* Authorization
* Accept-Encoding
* Connection
* Cookie

???

* Authorization - provides login info (for popups)
* Accept-Encoding - gzip or deflate
    * New one called Brotli (`br` in the header)
        * MacOS utility: `brew install zopfli`
* Connection - keep-alive
* Cookie - return a cookie that the server has previously handed us

---
class: http-response

HTTP Response
=============

<pre><code>HTTP/1.0 <span class="status_code">201</span> Created
<span class="headers">Location: https://www.google.com/</span>
<span class="headers">Content-Type: application/json; charset=UTF-8</span>
<span class="blank"> </span>
<span class="body">{"rubyconf": "awesome", "day": 3}</span>
</code></pre>

<ul>
  <li><span class="status_code">Status code</span></li>
  <li><span class="headers">Headers</span></li>
  <li><span class="body">Body</span></li>
</ul>

???

* Status line - contains protocol, status code, and status description

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

---

Response Status Codes
=====================

* 400s - Client Error
    * 401 - Unauthorized
    * 403 - Forbidden
    * 404 - Not Found
    * 407 - Proxy Authentication Required
    * 422 - Unprocessable Entity
* 500s - Server Error
    * 500 - Internal Server Error
    * 502 - Bad Gateway
    * 504 - Gateway Timeout

???

* 405 - Method Not Allowed
* 418 - I'm a teapot
* 451 - Unavailable For Legal Reasons

---

Status Codes References
=======================

* https://httpstatuses.com/
* https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
* https://tools.ietf.org/html/rfc7231#section-6
* https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml

---

Response Headers
================

* Content-Length
* Content-Type
* Content-Encoding
* Content-Disposition
* Location
* Set-Cookie
* WWW-Authenticate

???

* Content-Encoding - body has been gzip or deflated
* Content-Disposition - used to tell browser to download instead of display
    * Can also provide a default filename to save as
* Location - browser should redirect to the value of this header
* Set-Cookie - tells browser to remember a token to pass back next time
    * This is how we get statefulness in a stateless protocol
* WWW-Authenticate - asks for user to authenticate (via browser popup)

---

Proxies
=======

* Proxy - something that acts in place of another


* Web proxies intercept HTTP requests
  * Can modify the request or response
  * Can modify headers or body content

---

Proxies
=======

* Good for caching
* Can add security
    * SSL termination / offloading
    * Authentication


* Transparent vs. non-transparent
* Reverse vs. forward

???

* Transparent means we don't need to tell our user-agent about it
* Reverse proxy (always transparent) is near the server(s)
* Forward proxy is near the client(s)

---

Proxies for Troubleshooting
===========================

* [Charles proxy](https://www.charlesproxy.com)
* [Fiddler](https://www.telerik.com/fiddler)
* [mitmproxy](https://mitmproxy.org/)
* [Zed Attack Proxy](https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project)
* [Proxy.app](https://www.proxyapp.io/) (MacOS)
* [Slowy](http://slowyapp.com/) (MacOS)

???

* View *all* of the HTTP/HTTPS traffic between your machine and the Internet
* Slowy slows down your network connection, to test under those conditions

---

CDNs
====

* Content delivery network
* Caching proxies for static content
* Content is distributed
* Content is placed closer to more clients
* BGP Anycast for DNS servers
    * Determines which content server is closest


* DDoS protection

---

Troubleshooting
===============

* ping
* traceroute
* telnet
* netstat -plnet (on servers)
* openssl s_client (HTTPS)
* tcpdump
* Wireshark

???

* Mac `netstat` takes only `-na`, not `-plet`
    * Pipe it to `grep LISTEN`

* You can capture with `tcpdump` and view in Wireshark

* Consider the various layers of the OSI model
    * ping, traceroute = network layer
    * telnet = transport layer
    * s_client = presentation layer

---

HTTP/2
======

* Google SPDY project
* Header compression (HPACK)
* TLS required by every implementation
    * Not really related to HTTP/2
    * Probably due to use of ALPN TLS extension
* Binary framing instead of text-based
    * Same semantics as HTTP/1.1 though
* http://http2.github.io/

???

* HTTP/2 has only been around a couple years
    * But it's available in almost all browsers now
    * It's available in most web servers now
    * Not in most app servers
        * Use an HTTP/2 proxy
    * Not in many proxy servers
* ALPN = Application-Layer Protocol Negotiation
    * Earlier implementations used NPN

---

HTTP/2
======

* Multiplexed connections
    * Grab multiple resources simultaneously
        * Over a single TCP connection
* Server push
* Removes the need to combine JS, CSS, and images
* Starts with an HTTP/1.1 connection using `Upgrade` and `HTTP2-Settings` headers
    * Returns a 101 status code (Switching Protocols)

???

* Chrome and Google can also use QUIC transport layer
    * Basically best of UDP and TCP

---

HTTP/2 - Support
================

* Chrome 41
* Firefox 36
* IE 11 - only in Windows 10
* Edge
* cURL 4.x
    * With `--http2` flag, if feature compiled in
    * Default in 7.47.0
* Wireshark 1.99

???

* All the major browsers have good HTTP/2 support now
* Unfortunately (in 2015), I couldn't get cURL and Nginx to cooperate
    * Had to compile OpenSSL 1.0.2 and cURL 7.41 with nghttp2
    * They used NPN instead of ALPN

---
HTTP/2 - Support
================

* Nginx 1.9.5
* Apache 2.4.17
    * mod_http2
* HAProxy - NO

???

* Current versions of servers have pretty good support
* Nginx 1.13.9 and newer have server push
    * Can specify directly within Nginx config file
    * Can user HTTP response headers to tell Nginx what to push
* Need to have OpenSSL 1.0.2 for APLN though
    * Debian 9 and Ubuntu 16.04+ are good
    * RHEL/CentOS 7.4 should be good
* HAProxy 1.7 can speak HTTP/2 to a back-end
    * But won't work as an HTTP/2 proxy
        * Unclear when it will be supported

---
class: title, middle, center

Exercises
=========

https://http-workshop.boochtek.com/slides

* Tip: Hit `P` to toggle presenter notes

???

* See? Presenter Notes!

---

Telnet - HTTP/0.9
=================

Use telnet, but don't specify a version of HTTP:

~~~ bash
telnet http-workshop.boochtek.com 80
~~~

~~~
GET http://http-workshop.boochtek.com/
~~~

Note that you couldn't specify request headers
Note that there are no response headers

---

Telnet - HTTP/1.0
=================

Use telnet, and specify HTTP/1.0 in the request:

~~~ bash
telnet http-workshop.boochtek.com 80
~~~

~~~
GET http://http-workshop.boochtek.com/ HTTP/1.0
Host: localhost

~~~

Note that you need a blank line after the last header

---

Telnet - HTTP/1.1
=================

Use telnet, specifying HTTP/1.1:

~~~ bash
telnet http-workshop.boochtek.com 80
~~~

~~~
GET / HTTP/1.1
Host: http-workshop.boochtek.com

~~~

Note that you don't need the protocol and server in the request line (except HTTP/0.9)

How does this differ from HTTP/1.0?
  * Hint: Hit Control+C

---

Wget
====

Use wget:

~~~ bash
wget -d http://http-workshop.boochtek.com/
~~~

Where did it put the result?

* Tip: Use `-o` to specify the output file

???

* Mac Homebrew wget doesn't support `-d` out of the box
    * `brew reinstall wget --with-debug`

---

cURL
====

Use cURL:

~~~ bash
curl -v http://http-workshop.boochtek.com/
curl -v http://http-workshop.boochtek.com/reflect
~~~

Note the leading `*`, `>`, and `<` characters
  * What does each prefix character mean?

???

* `>` indicates traffic being sent from client to server
* `<` indicates traffic being sent back from the server to the client
* `*` indicates information about the connection between the client and server
* The response body has no prefix characters

---

HTTPie
======

Use HTTPie:

~~~ bash
http -v http://http-workshop.boochtek.com/
http -v http://http-workshop.boochtek.com/reflect X-Extra:Cool
http --style=xcode -v http://http-workshop.boochtek.com/
~~~

What's different about this output compared to cURL?
  * Which do you prefer?

???

* Note: You can use `curl` in place of `http` in most of the following exercises if you want

---

Redirect
========

Let's see what a redirect looks like:

~~~ bash
curl -v http://http-workshop.boochtek.com/redirect
http -v http://http-workshop.boochtek.com/redirect
~~~

Notice the status code and `Location` header

Now let's follow the redirect

~~~ bash
curl -v -L http://http-workshop.boochtek.com/redirect
http -v --follow http://http-workshop.boochtek.com/redirect
~~~

---

POST
====

Let's see what a POST looks like:

~~~ bash
curl -v -X POST http://http-workshop.boochtek.com/post -d key=value -d http=fun
http -v POST http://http-workshop.boochtek.com/post key=value http=fun
~~~

Note the request body being sent

---

Caching
=======

Let's see how a cache would use headers:

~~~ bash
URL='http://http-workshop.boochtek.com/etag'
http -v $URL
ETAG=$(curl -v $URL 2>&1 | grep ETag: | cut -d' ' -f3)
curl -v -H "If-None-Match: $ETAG" $URL
http -v $URL "If-None-Match: $ETAG"
MODIFIED=$(curl -v $URL 2>&1 | grep Last-Modified: | sed -e 's/.*: \(.*\)/\1/')
curl -v -H "If-Modified-Since: $MODIFIED" $URL
http -v $URL "If-Modified-Since: $MODIFIED"
~~~

Note the status code when we supply the headers

Note that when we get a `304`, there's no body content included

???

* That crazy complicated stuff is just grabbing the content of the appropriate headers

* Note how the names of the request tags and response tags go together
    * Response: `ETag` -> Request: `If-None-Match`
    * Response: `Last-Modified` -> Request: `If-Modified-Since`

---

HTTPS - Telnet
==============

Try to telnet to an HTTPS server:

~~~ bash
telnet www.google.com 443
~~~

~~~
GET / HTTP/1.0
~~~

~~~ bash
telnet http-workshop.boochtek.com 443
~~~

~~~
GET / HTTP/1.0
Host: http-workshop.boochtek.com
~~~

What happens? Why?

???

* Note that Nginx is smarter about this than Google

---

HTTPS - OpenSSL
===============

Try using OpenSSL `s_client` instead:

~~~ bash
openssl s_client -connect http-workshop.boochtek.com:443
~~~

~~~
GET / HTTP/1.0
Host: http-workshop.boochtek.com

~~~

* Tip: Check out the `-pause` and `-debug` options to `s_client`

---

HTTPS - HTTPie
==============

Try using HTTPie instead:

~~~ bash
http -v HEAD https://http-workshop.boochtek.com
~~~

---

HTTPS - cURL
============

Try using cURL instead:

~~~ bash
curl -v -X HEAD https://http-workshop.boochtek.com
~~~

---

Non-Transparent Proxy
=====================

Proxy your requests through Squid (on port 3128):

~~~ bash
URL='http://http-workshop.boochtek.com/reflect'
http -v --proxy http://localhost:3128 $URL
export http_proxy=http://localhost:3128
http -v $URL
unset http_proxy
~~~

What did the proxy change?

???

* Bonus: Take a look at the bottom of `/etc/squid3/squid.conf`

---

Reverse Proxy
=============

We're using Nginx as a reverse proxy to add TLS security.
If you're on the server, you can bypass that:

~~~ bash
curl -v https://localhost:3000/
http -v https://localhost:3000/
~~~

???

* Bonus: Take a look at `/etc/nginx/sites-enabled/http-workshop.boochtek.com.conf`

---

Web Browsers
============

Try some of the above exercises using a browser

The response from https://http-workshop.boochtek.com is especially interesting

* Tip: Take a look at the Network tab in Developer Tools

---

TUI Browsers
============

Try some of the above exercises using a TUI-based browser

* lynx
* links
* elinks
* w3m

What are the differences between these browsers?
  * Which do you like best?

???

* TUI = Text-based User Interface
    * Basically a GUI in the terminal

---

Netstat
=======

See what services are listening on what ports:

~~~ bash
sudo netstat -plnet
sudo netstat -panet
~~~

???

* This is helpful in determining if your app is listening on the port you think it is

* Mac `netstat` takes only `-na`, not `-plt`
    * Pipe it to `grep LISTEN`

---

Tcpdump
=======

Let's capture the raw packets going across the network:

~~~ bash
sudo tcpdump -A -i lo -l port 3000 > tcpdump.out &
http http://username:password@http-workshop.boochtek.com
fg ; # Hit Ctrl+C to exit
less tcpdump.out
~~~

Let's find the password that went across the wire:

~~~ bash
cat tcpdump.out | grep Basic | cut -d' ' -f3 | base64 -d
~~~

???

* Tip: You can capture with `tcpdump` and view in Wireshark

---

Logs
====

Pick some previous exercises and run them while watching Rails logs

Hint: Use `tail -f`, `tailf`, or `less +F`

* Tip: Use `tmux` to run multiple things in separate "windows"

???

* Bonus: Do the same for the Nginx and Squid proxy logs

---

Thanks
======

* Charlie Sanders
  * Feedback
  * Several exercises
  * Lab assistant
* Julian Simioni
  * Feedback
  * Lab assistant
* Olivier Lacan
  * Feedback

---

Further Info
============

* [RFC 2616][rfc2616]
* [What Happens When][whw]
  * Covers every step involved in showing a page in a browser
    * From entering the URL to the page rendering
    * Hardware, operating system, networking, ...
    * Very detailed and thorough
* [Common HTTP Headers][http-headers]
* [HTTP/2 Official Site][http2]
* [Video on benefits of HTTP/2][http2-video]
* [Nginx HTTP/2 Support][nginx-http2]

[rfc2616]: http://www.rfc-editor.org/rfc/rfc2616.txt
[whw]: https://github.com/alex/what-happens-when
[http-headers]: http://en.wikipedia.org/wiki/List_of_HTTP_header_fields
[http2]: http://http2.github.io/
[http2-video]: https://www.youtube.com/watch?v=eunWfaTeodc
[nginx-http2]: http://nginx.com/blog/how-nginx-plans-to-support-http2/

---

Colophon
========

* [Remark] - JavaScript slide show from Markdown

[Remark]: http://remarkjs.com/
[debian-installer]: https://www.debian.org/devel/debian-installer/

---

Feedback
========

* Twitter: @CraigBuchek
* GitHub: booch
* GitHub: boochtek
* Email: craig@boochtek.com
