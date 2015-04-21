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

HTTP Request
============

* Request line
  * Method
  * URL path
* Headers
* Body

~~~
GET http://google.com/ HTTP/1.1
Host: google.com
Accept: */*

~~~


---

HTTP Methods
============

* GET
* POST
* PUT
* DELETE

* Safe methods
  * Do not have any effect on information
  * GET, HEAD

* Idempotent methods
  * Can call multiple times without any additional effect
  * GET, HEAD, PUT, DELETE

???

* `rails new hello`
* `cd hello`
* `rails g controller hello`
* Add to `config/routes.rb`:
  * `root 'hello#index'`
* Add to `app/controllers/hello_controller.rb`:
  * `def index; render text: "<h1>Hello, World!</h1>".html_safe; end`
* `rails s`


---


HTTP Response
=============

* Status line
  * Status code
* Headers
* Body

~~~
HTTP/1.0 301 Moved Permanently
Location: http://www.google.com/
Content-Type: text/html; charset=UTF-8

<HTML><HEAD>
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="http://www.google.com/">here</A>.
</BODY></HTML>
~~~


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


---

Response Status Codes - More
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

???

* Modify the controller action, and look at results in `curl`, browser, and `wget`:
  * `headers["foo"] = "*** bar ***"`
  * `headers["Location"] = "https://google.com/"; render text: "", status: 302`
  * `redirect_to "https://google.com/"`

---

# Proxies

* Proxy - act in place of another

* Web proxies intercept HTTP requests
  * They can modify the request or response

* Good for caching
* Can add some security

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

# Troubleshooting

* ping
* traceroute
* telnet
* netstat -plant
* openssl s_client (HTTPS)
* tcpdump
* Wireshark

???

* Linux `netstat` takes `-plant`
* Mac `netstat` takes only `-na`; pipe it to `grep LISTEN`

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

* Nginx will support it by the end of 2015
  * 1.5.10 supports SPDY/3.1
* Apache seems to have no plans, but mod_spdy is available
* Chrome support is enabled with `--enable-spdy4` or via `chrome://flags`
* Firefox (34) support is enabled with `network.http.spdy.enabled.http2draft`
  * Has supported SPDY since version 15
* IE 11 will support HTTP/2


---

# Start Vagrant

Change to the directory containing and `http_exploration.box`

~~~ bash
vagrant box add http_exploration ./http_exploration.box
vagrant init http_exploration
vagrant up
vagrant ssh
~~~

When you're done, stop the VM with `vagrant halt`

---

# Telnet - HTTP/0.9

Use telnet, but don't specify a version of HTTP in the request

~~~ bash
telnet google.com 80
~~~

~~~
GET http://google.com/
~~~

Note that you couldn't specify request headers
Note that the response was HTTP/1.0

---

# Telnet - HTTP/1.0

Use telnet, and specify HTTP/1.0 in the request

~~~ bash
telnet google.com 80
~~~

~~~
GET http://google.com/ HTTP/1.0
Host: google.com

~~~

Note that you had to specify the `Host` header
Note that you need a blank line after the last header

---

# Telnet - HTTP/1.1

Use telnet, and specify HTTP/1.1 in the request

~~~ bash
telnet google.com 80
~~~

~~~
GET / HTTP/1.1
Host: google.com

~~~

Note that you can simplify the request line (except HTTP/0.9)

What's different about this, compared to HTTP/1.0?
  * Hint: hit Control+C

---

# Wget

Use wget

~~~ bash
wget -d http://google.com
~~~

Note that it followed the redirect to `www.google.com`

Where did it put the result?

Tip: use `-o` to specify the output file

???

* Mac Homebrew wget doesn't support `-d` out of the box
  * `brew reinstall wget --with-debug`


---

# cURL

Use cURL

~~~ bash
curl -v http://google.com
~~~

Note the leading `*`, `>`, and `<` characters
  * Info about connecting to the server is prefixed with `*`
  * What the client sends to the server is prefixed with `>`
  * What the server sends back to the client is prefixed with `<`
  * The response body contains no prefix character

---

# HTTPie

Use HTTPie

~~~ bash
http -v http://google.com
~~~

What's different about this ouput compared to cURL?
  * Which do you prefer?

---

# HTTPS - Telnet

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

# HTTPS - OpenSSL

Try using OpenSSL s_client instead:

~~~ bash
openssl s_client -connect www.google.com:443
~~~

~~~
GET / HTTP/1.0
Host: www.google.com

~~~

Tip: Check out the `-pause` and `-debug` options to `s_client`

---

# HTTPS - HTTPie

Try using HTTPie instead:

~~~ bash
http -v HEAD https://www.google.com
~~~

---

# HTTPS - cURL

Try using cURL instead:

~~~ bash
curl -v -X HEAD https://www.google.com
~~~

---

# Netstat

See what services are listening

~~~ bash
sudo netstat -plant
~~~

---

# Proxy - Squid

Proxy your requests through Squid

~~~ bash
curl -v --proxy localhost:3128 -X HEAD http://google.com
http -v --proxy http:http://localhost:3128 HEAD http://google.com
http_proxy=http://localhost:3128 curl -v -X HEAD http://google.com
~~~

What did the proxy change?

---





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

