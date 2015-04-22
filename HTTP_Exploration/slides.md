class: title, middle, center

# http://exploration

* by Craig Buchek


* RailsConf
* April 23, 2015


* Please install Vagrant and VirtualBox
* Please copy BOX file from USB keys

---

Feedback
========

* Twitter: @CraigBuchek
* GitHub: booch (personal, presentations)
* GitHub: boochtek (projects)
* Email: craig@boochtek.com

---

About Me
========

* Independent web developer
  * BoochTek
* Ruby / Rails programmer since 2006
  * Network and System Admin before that
* Agile practitioner
  * This Agile Life podcast

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
* HTTP/2.0 (2015)
  * http://http2.github.io/

---

HTTP Basics
===========

* Stateless
* Text-based
* Request / Response
* Headers
* Body

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

---

Safe Methods
============

* Do not have any effect on information
* GET, HEAD

---

Idempotent Methods
==================

* Can call multiple times without any additional effect
* GET, HEAD, PUT, DELETE

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

---

Response Status Codes
=====================

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

Proxies
=======

* Proxy - to act in place of another


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
* netstat -plant
* openssl s_client (HTTPS)
* tcpdump
* Wireshark

???

* Mac `netstat` takes only `-na`, not `-plt`
  * Pipe it to `grep LISTEN`

* You can capture with `tcpdump` and view in Wireshark

---

HTTP/2
======

* SPDY
* Header compression (HPACK)
* TLS required by every implementation
  * Not really related to HTTP/2
  * Probably due to use of ALPN TLS extension
* Binary framing instead of text-based
  * Same semantics as HTTP/1.1 though

???

* ALPN = Application-Layer Protocol Negotiation

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

---

HTTP/2 - Support
================

* Chrome 41
* Firefox 36
* IE 11 - only in Windows 10
* Nginx will support it by the end of 2015
  * 1.5.10 supports SPDY/3.1
* Wireshark 1.99
* Apache seems to have no plans, but mod_spdy is available

---

Start Vagrant
=============

Change to the directory containing and `http_exploration.box`

~~~ bash
vagrant box add http_exploration ./http_exploration.box
vagrant init http_exploration
vagrant up
vagrant ssh
~~~

When you're done, stop the VM with `vagrant halt`

---

Telnet - HTTP/0.9
=================

Use telnet, but don't specify a version of HTTP in the request

~~~ bash
telnet localhost 3000
~~~

~~~
GET http://localhost/
~~~

Note that you couldn't specify request headers
Note that there are no response headers

---

Telnet - HTTP/1.0
=================

Use telnet, and specify HTTP/1.0 in the request

~~~ bash
telnet localhost 3000
~~~

~~~
GET http://localhost:3000/ HTTP/1.0
Host: localhost

~~~

Note that you need a blank line after the last header

---

Telnet - HTTP/1.1
=================

Use telnet, and specify HTTP/1.1 in the request

~~~ bash
telnet localhost 3000
~~~

~~~
GET / HTTP/1.1
Host: localhost

~~~

Note that you can simplify the request line (except HTTP/0.9)

What's different about this, compared to HTTP/1.0?
  * Hint: hit Control+C

---

Wget
====

Use wget

~~~ bash
wget -d http://localhost:3000/
~~~

Where did it put the result?

Tip: use `-o` to specify the output file

???

* Mac Homebrew wget doesn't support `-d` out of the box
  * `brew reinstall wget --with-debug`

---

cURL
====

Use cURL

~~~ bash
curl -v http://localhost:3000/
curl -v --proxy localhost:3128 http://localhost:3000/reflect \
  | grep 'HTTP_'
~~~

Note the leading `*`, `>`, and `<` characters
  * What does each prefix character mean?

---

HTTPie
======

Use HTTPie

~~~ bash
http -v http://localhost:3000/
http --style=xcode -v http://localhost:3000/
~~~

What's different about this ouput compared to cURL?
  * Which do you prefer?

---

HTTPS - Telnet
==============

Try to telnet to an HTTPS server:

~~~ bash
telnet www.google.com 443
~~~

~~~
GET / HTTP/1.0
Host: www.google.com

~~~

What happens? Why?

---

HTTPS - OpenSSL
===============

Try using OpenSSL `s_client` instead:

~~~ bash
openssl s_client -connect www.google.com:443
~~~

~~~
GET / HTTP/1.0
Host: www.google.com

~~~

Tip: Check out the `-pause` and `-debug` options to `s_client`

---

HTTPS - HTTPie
==============

Try using HTTPie instead:

~~~ bash
http -v HEAD https://www.google.com/
~~~

---

HTTPS - cURL
============

Try using cURL instead:

~~~ bash
curl -v -X HEAD https://www.google.com/
~~~

---

Netstat
=======

See what services are listening

~~~ bash
sudo netstat -plant
~~~

---

Proxy - Squid
=============

Proxy your requests through Squid, which is running on port 3128

~~~ bash
curl -v --proxy localhost:3128 http://localhost:3000/
curl -v --proxy localhost:3128 http://localhost:3000/reflect \
  | grep 'HTTP_'
http -v --proxy http:http://localhost:3128 http://localhost:3000/
http_proxy=http://localhost:3128 curl -v http://localhost:3000/
~~~

What did the proxy change?

Bonus: Take a look at the bottom of `/etc/squid3/squid.conf`

---

Proxy - Nginx
=============

Use Nginx as a reverse proxy to add TLS security

~~~ bash
curl -v --insecure https://localhost/
http -v --verify=no https://localhost/
~~~

Note: We're ignoring invalid SSL certs here -- never do this!
  * You would be vulnerable to a man-in-the-middle attack

---

Thanks
======

* Charlie Sanders
  * Feedback
  * Several exercises
  * Lab assistant
* Julian Simioni
  * Feedback
  * Live demo

---

Further Info
============

* [What Happens When][whw]
* [Nginx HTTP/2 Support][nginx-http2]

[whw]: https://github.com/alex/what-happens-when
[nginx-http2]: http://nginx.com/blog/how-nginx-plans-to-support-http2/

---

Feedback
========

* Twitter: @CraigBuchek
* GitHub: booch
* Email: craig@boochtek.com
