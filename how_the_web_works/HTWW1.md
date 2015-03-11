class: title, middle, center

How The Web Works - Part 1
==========================

* Everything You (Never) Ever Wanted to Know About The Web

* by Craig Buchek
* SLUUG
* March 11, 2015

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

* History
* Web Browsers
* Web Servers
* HTML
* CSS
* JavaScript

---

History - The Internet
======================

* ARPANET - 1969
* NSFNET - 1985-1995
* Commercial activity - 1992

---

History - Predecessors
======================

* Vannevar Bush's microfilm-based "memex" (1945)
  * [As We May Think][awmt]
* Ted Nelson's [Project Xanadu][px] (1960)
  * Coined term "hypertext" (1962)
  * Not completed until 2014
* Douglas Engelbart's NLS (1968)
  * Part of the [Mother of All Demos][moad]
* Gopher (early 1991)

[awmt]: http://www.theatlantic.com/magazine/archive/1945/07/as-we-may-think/303881/?single_page=true
[px]: http://www.xanadu.com/
[moad]: http://en.wikipedia.org/wiki/The_Mother_of_All_Demos

---

History - WorldWideWeb
======================

* Tim Berners-Lee
* 1990
* NeXT
* CERN
* Goes public August 23, 1991

---

Why Did HTTP Beat Gopher?
=========================

* University of Michigan was going to charge for the server software
  * WorldWideWeb was made public domain in 1991
* Early web browsers included Gopher functionality
* HTML pages are more free-form
  * Gopher was hierarchical
  * Gopher is more like a list of docs you can download
    * Sort of like FTP with an HTML interface

???

* Demo Gopher through HTTP proxy: http://gopher.floodgap.com/gopher/
  * Click on a few things on the right
  * Maybe do some searches

---

The Web Today
=============

"The Web is the sum of all human knowledge plus porn."
 -- Ron Gilbert

---

Browsers
========

* Browser - software running on *your* computer to access web sites

* [WorldWideWeb][www] - 1991
* NCSA Mosaic - 1992/1993
* Netscape Navigator - 1994
* Internet Explorer - 1995
* Opera - 1996
* Netscape Communicator - 1997
* Mozilla - 1998
* Mozilla Firefox - 2002
* Safari - 2003
* Google Chrome - 2008

[www]: http://upload.wikimedia.org/wikipedia/commons/7/76/WorldWideWeb_FSF_GNU.png

---

Browsers - Non-Graphical
========================

* Lynx
* Links
* Elinks
* w3m

???

* Demo a couple of these

---

User Agents
===========

* Technical term for a web client
* Includes:
  * Browsers
  * Web spiders
  * Downloaders
  * Command-line clients
    * Curl
    * Wget
    * HTTPie

???

* Show some user agent strings
  * http://www.useragentstring.com/
  * http://www.useragentstring.com/pages/useragentstring.php

---

Web Servers
===========

* Web Server - hardware system or software used to provide web sites

* CERN httpd - 1990
* NCSA httpd - c. 1992
* Netscape Enterprise Server - 1994
* Apache httpd - 1995
* Microsoft IIS - c. 1995
* Nginx - 2002

---

Web Applications
================

* Web App - a web site that "does something"

---

Web Applications - Server Side
==============================

* Application Server - web server software designed for web apps
  * Apache Tomcat
  * tc Server (Pivotal, VMware, Spring)
* Server-side languages
  * PHP
* Application frameworks
  * Ruby on Rails
  * ASP.NET

---

Web Applications - Client Side
==============================

* Single-page apps (SAP)
* AJAX
* Frameworks
  * Backbone
  * Angular
  * Ember
  * React

---

HTML
====

* Hypertext Markup Language

* The markup language that web pages are written in
* Tags for different things
  * Each has a meaning, independent from the way it is displayed

???

* Demo the HTML of this page

---

CSS
===

* CSS describes how the HTML should look

???

* Demo the CSS for this page

---

JavaScript
==========

* On (almost) every browser
  * De facto language for client-side programming
* Brandon Eich at Netscape
  * Written in 10 days 
* Originally designed for client and server
  * Node brings it back to the server side
* Much hated at first
* Now [tolerated] or liked

[tolerated]: http://i.imgur.com/wR3ZxfB.jpg

???

* Demo the JavaScript for this page

---

Web 2.0
=======

* Coined by Tim O'Reilly
* Noticed a qualitative difference in web sites
* More interactive, dynamic, participatory
* Web "as a platform"
* Different look and feel
* AJAX

---

HTML 5
======

* Recent update to the standards
  * HTML, CSS, and JavaScript
* Helps write client-side web apps more easily

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

Part 2
======

* STLLUG
* Thursday, March 19, 2015

* How the browser and server communicate
* HTTP and related topics
  * HTTPS
  * HTTP/2
  * Proxies

---

Credits
=======

* Wikipedia
  * URL example: http://en.wikipedia.org/wiki/URI_scheme#Examples
* Charlie Sanders for feedback

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
