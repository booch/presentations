layout: true

<footer>
  <p class="left">@CraigBuchek</p>
  <p class="right">http://craigbuchek.com/intellectual-property</p>
</footer>

---
class: title, middle, center
# Intellectual Property
# and Licensing
## A Primer for Web Developers

![Craig Buchek's avatar](images/CraigBuchek-avatar.png)

???

* Welcome!
* I'm Craig Buchek
* I've been doing web development of various kinds since about 1995
    * I learned HTML in about 1995
    * Mostly Ruby and Rails since 2006
* I ran the STLLUG for many years
    * My interest in GNU/Linux led me to learn a lot
        * Including about intellectual property and licensing
* My Twitter handle is there in the lower left
    * You can tweet at or about me
* You can follow along at the URL in the lower right
    * Hit `P` to see presenter notes

---

# IANAL

* I Am Not A Lawyer
* This is not legal advice

???

* Standard disclaimers
* If you need legal help, contact a lawyer

---
class: middle

<blockquote>
<p>
He who receives an idea from me, receives instruction himself without lessening mine
as he who lights his taper at mine, receives light without darkening me.
</p>
<cite>— Thomas Jefferson, 1813</cite>
</blockquote>

???

* The Founding Fathers spent quite a bit of time worrying about intellectual property
* Ben Franklin had many inventions, but never patented them
    * Franklin stove
    * Lightning rod
    * Bifocal glasses

---

# Intellectual Property

* Copyright
* Trademark
* Patent


* Sometimes abbreviated as "IP"

???

* These are the 3 primary types of IP
* We'll cover each of these in more detail

---

# Intellectual Property

* Trade secret
* Moral rights
* Trade dress
* Geographical indication
* Certification marks
* Indigenous intellectual property
* Plant variety rights
* Mask work
* Database rights
* Right of publicity

???

* There are quite a few "lesser" types of intellectual property
* Moral rights
    * Right of attribution (or to be published anonymously or pseudonymously)
    * Right to the integrity of the work
* Geographical indication
    * PDO, DOC, DOCG, DO, AOC, AOP
    * Like the right to call your sparkling wine "champagne"
        * Or "cognac", "Asiago cheese"
    * Related to collective trademark
* Certification marks
    * Like "UL Listed" or "Energy Star"
* Mask work is for electronic circuit designs

---

# Intellectual "Property"

* Physical property is rivalrous
* Intellectual works are non-rivalrous
    * A copy doesn't directly affect the value of the original

???

* Property is not a great analogy for intellectual property
* "non-rivalrous" means it can't be "used up"
    * This is what the Thomas Jefferson quote was referring to

---

# Work For Hire

* Work created by an employee as part of the employee’s regular duties
* Any or all of the copyright owner’s exclusive rights can be transferred
* Any or all of the patent owner’s exclusive rights can be transferred

---
class: transition, copyright

# Copyright

---

# Copyright

* Most "works" fixed in a tangible format
* Authorized by the US Constitution
* Majority of this talk will cover copyright
    * And licensing of copyrighted works

???

* See [Title 17](https://www.law.cornell.edu/uscode/text/17) of the US Code
    * Fairly readable

---

# History of Copyright

* Wasn't really necessary before the printing press
* Stationers' Company, 1557 (England)
    * Publishers' monopoly
* Statute of Anne, 1710 (Great Britain)
    * 14-year term, possible 14-year extension
* US Constitution, 1787
* Copyright Act of 1790 (US)

???

* Stationers' Company was a guild of publishers
    * Received a royal charter
    * Had to register the publication
    * Copyright applied to the publisher
* Statute of Anne
    * Copyright applied to the author
    * Had to register the publication
    * Had to provide a copy to the royal library or a university library
    * Extension was only possible if you were still alive
* Copyright Act of 1790
    * Copied almost verbatim from the Statute of Anne
    * Added maps and charts as copyrightable

---

class: middle

<blockquote>
<p>
The Congress shall have power [...]
To promote the Progress of Science and useful Arts,
by securing for limited Times to Authors and Inventors
the exclusive Right to their respective Writings and Discoveries
</p>
<cite>— US Constitution, Article I, Section 8, Clause 8</cite>
</blockquote>

???

* The "Copyright Clause" or "Copyright and Patent Clause"
* One of the "enumerated powers" of Congress

---

# Copyrightable Works

* Literary works
* Musical works (and lyrics)
* Dramatic works
* Pantomimes and choreographic works
* Pictorial, graphic, and sculptural works
* Motion pictures and other audiovisual works
* Sound recordings
* Architectural works

???

* From https://www.copyright.gov/circs/circ01.pdf

---

# NOT Copyrightable

* Titles, names, short phrases, slogans, URLs
    * May be trademarked
* Ideas, procedures, methods, processes, principles, discoveries
    * May be patented
* Familiar symbols or designs
* Typefaces, fonts, and lettering
* Layout, formatting, design
* Blank forms
    * Time cards, scorecards, address books, date books
* Recipes, listings of ingredients or contents

???

* From https://www.copyright.gov/circs/circ33.pdf

---

# Copyright Rights

* Make copies of the work
* Prepare derivative works
* Distribute copies of the work to the public
    * Sale or other transfer of ownership
    * Rental, lease, or lending
* Perform the work publicly
* Display the work publicly
* Transmit the work publicly

???

* These rights are "exclusive"
    * Only the copyright owner has them
* The copyright owner can authorize others to exercise these exclusive rights
* Derivative works are what we usually deal with as software developers

---

# Copyright Length

* Copyright Act of 1790
    * 14 years + potential 14-year extension
* Copyright Act of 1831
    * 21 years + potential 21-year extension
* Copyright Act of 1909
    * 28 years + potential 28-year extension
* Copyright Act of 1976
    * Life of the author + 50 years
    * 75 years for works for hire
* Copyright Term Extension Act of 1998
    * Life of the author + 70 years
    * 95 years for works for hire

???

* Copyright terms have increased over the years
* There's a theory that says that the Micky Mouse copyrights will never expire
    * It was first published in 1928
    * Disney is said to "own" several Congress members
* Ironically, modern software probably deserves a *shorter* term
    * Think of all the software written in the 1980s that no longer has any commercial value
        * Keep in mind that the *purpose* of copyright is to make works available to the public

---

# Copyright Process

* Copyright exists from the moment the work is created
    * "Fixed in tangible form"
* Copyright notice is optional
    * Copyright symbol, owner, year, "All rights reserved"
* Registration is optional
* Mandatory deposit

???

* Before 1989, copyright statement was *required*
* Registration is required if you want to file an infringement lawsuit
* Registration establishes _prima facie_ evidence of the validity of the copyright
    * "prima facie" is Latin for "at first sight"
        * It means "accepted as correct until proved otherwise"
    * If within 5 years of publication
* Mandatory deposit requires sending 2 copies to the Library of Congress
    * Within three months of publication
    * Exceptions for online-only electronic works (among others)
    * See https://www.copyright.gov/circs/circ07d.pdf

---

# Fair Use

* Permitted use of copyright-protected works in certain circumstances
    * Without requiring a license


* Purpose and character of the use
    * Whether used for commercial, non-profit, or educational purposes
* The nature of the copyrighted work
* Amount and substantiality of the portion used in relation to the work as a whole
* The effect of the use upon the potential market for or value of the copyrighted work

???

* Four factors are considered to determine "fair use"
* These come from Section 107 of the Copyright Act

---
class: transition, trademark

# Trademark

---

# Trademark

* Names of companies and products
* Phrases
* Logos, sounds, colors, smells, etc.

???

* Can't be just a description of the item
* Service marks
* No expiration
    * As long as the mark is still in use

---

# History of Trademark

* Trademark Act of 1870 (US)
* Trademark Act of 1881 (US)

???

* Trademark Act of 1870 was struck down by the Supreme Court
    * Because it tried to be an extension of the copyright clause
* Trademark Act of 1881 was based instead on the commerce clause

---

# Trademark Purpose

* Reduce confusion in the marketplace
* Protect consumers from fraud
* Distinguishing goods and services of one business from those of others

???

* Trademark must not be a generic or descriptive term

---

# Trademark Rights

* Exclusive use of the mark
    * In relation to the products or services for which it is registered
    * In some cases for unrelated products or services
    * May be limited in territory
* Licensing others to use the mark
* Does not prevent "fair use"
    * Using the mark to refer to the actual product or company

???

* Fair use allows you to compare yourself to the competition in advertisements
* Using someone's trademark in your domain may be an issue
    * If you're using it to compete and cause confusion
    * Not if you're using free speech to complain about a company

---

# Trademark Process

* Use the mark in the marketplace (™️)
* Registration with USPTO (®)
    * Review by USPTO
    * Publication for opposition

---

# Trademark Erosion

* Trademark can be lost if not used
* Trademark can be lost if not defended from dilution

???

* Trademarks will typically expire after 3-5 years of non-use
* https://en.wikipedia.org/wiki/List_of_generic_and_genericized_trademarks
* Trademarks that were lost due to genericization:
    * Aspirin
    * Dry ice
    * Laundromat
    * Cellophane
    * Trampoline
    * Dumpster
    * Zipper
* Trademarks in jeopardy of being lost due to genericization:
    * Xerox
    * Kleenex
    * Jacuzzi
    * Crock-Pot
    * Ping Pong
    * Thermos
    * Velcro

---
class: transition, patent

# Patent

---

# Patent

* Innovative inventions, methods, processes
* Authorized by the US Constitution
* Must be novel, useful, and non-obvious
* Software patents are a legal minefield
* Recent rulings have lessened scope of some patents

---

# Patent Purpose

* Promote the progress of science and useful arts
    * Give financial incentives for R&D
* Give a limited-time monopoly
    * In exchange for disclosing the invention to the public

---

# Patent Rights

* Exclude others from making, using, selling, or importing the invention
* Ability to license to others
* Limited to 20 years, in most cases

???

* Note the "using" there

---

# Patent Process

* Write up description of how to make and use the invention
    * Must provide sufficient detail to replicate
        * By someone "skilled in the art"
* One or more "claims"
    * Covers the scope of the patent
* Review by a patent examiner
    * Assesses prior art, obviousness, utility
    * This will likely take a long time
* Yearly renewal fees
* You'll probably want to get help with this process

???

* "First to file"
    * Graham-Bell and the telephone patents
    * Unless there's "prior art"
* "prior art" = public information that's relevant to a patent's claim of originality
    * Can be in any form
    * Must exist before the patent application date
* If you want to write up your own patent application, real the Nolo Press books
* Will likely cost upwards of $10k

---
class: transition, licensing

# Licensing

---

# No License

* Copyright law applies
* You can use it if you have a copy
    * If you've purchased it
    * If you are given a copy legally
* You cannot give a copy to anyone
    * Except to sell your single copy (First Sale doctrine)
* You cannot make copies
    * Except for archival/backup purposes
* You cannot copy (substantial) portions
* You cannot make modifications

???

* Not 100% clear if you can make modifications to your own copy

---

# Free Software Definition

* The freedom to run the program, for any purpose (freedom 0)
* The freedom to study how the program works, and adapt it to your needs (freedom 1)
    * Access to the source code is a precondition for this
* The freedom to redistribute copies so you can help your neighbor (freedom 2)
* The freedom to improve the program, and release your improvements (and modified versions in general) to the public, so that the whole community benefits (freedom 3)
    * Access to the source code is a precondition for this.

???

* http://www.gnu.org/philosophy/free-sw.html

---

# Open Source Definition

* Similar in purpose (and implementation) to Free Software Definition
* Free Redistribution
* Source Code
* Derived Works
* Integrity of The Author's Source Code
* No Discrimination Against Persons or Groups
* No Discrimination Against Fields of Endeavor
* Distribution of License
* License Must Not Be Specific to a Product
* License Must Not Restrict Other Software
* License Must Be Technology-Neutral

???

* http://www.opensource.org/docs/osd

---

# Open Source v. Free Software

* Free Software emphasizes freedom
* Open Source emphasizes low cost, flexibility, control
    * Term was created to market Free Software
* Freedom and control are 2 sides of the same coin
* Other similar terms
    * Software Libre, Libre Software
    * FOSS
    * FLOSS
* I will use the terms interchangeably

---

# Open Source Licenses

* Many exist
    * [OSI list](http://opensource.org/licenses/category)
* Most programs use one of a small subset
    * GPL, LGPL
    * BSD, MIT, Apache

---

# GPL

* GNU General Purpose License
* Read it - REALLY
    * [GPL text](http://www.gnu.org/copyleft/gpl.html)
* Written in fairly readable English
    * Not too much legalese
    * Easy enough for non-lawyers to understand

---

# BSD License

* Berkeley Software Distribution
    * From BSD UNIX
    * University of California, Berkeley
* Several variants
    * 4-clause (old, obsolete, had to recognize UCB)
    * 3-clause (newer standard)
    * 2-clause (removes clause about endorsement)
* [BSD License text](https://opensource.org/licenses/BSD-3-Clause)

---

# Other Licenses

* [LGPL](https://www.gnu.org/licenses/lgpl-3.0.en.html)
    * Like GPL, but allows linking to non-GPL code
* [MIT](https://opensource.org/licenses/MIT)
    * Basically the same as 2-clause BSD
* [Apache License](http://www.apache.org/licenses/)
    * Similar to BSD license, but much longer
    * Has clauses pertaining to patents and trademarks
* [Artistic License](http://www.perlfoundation.org/artistic_license_1_0) - most lenient, but vague
* Sun, IBM licenses

???

* Apache license grants right to use patents
    * But not to use trademarks

---

# Public Domain

* Not a license, _per se_
* Author has NO rights to the work
* Government-created works
* Works whose copyright terms have expired
* Controversy whether you can explicitly make something public domain
* Creates a "commons" of works that anyone can build upon

---

# Shared Source

* Microsoft's attempt to blunt Open Source
* Didn't work too well - doesn't grant enough to be useful
* Microsoft now has 2 OSI-approved licenses
    * MSPL, MSRL
* Microsoft now using a few Open Source licenses for some things
    * WIX installer
    * SQL Server Express
    * WPF
    * Power Toys
    * IronPython
    * Apache support
    * http://www.microsoft.com/opensource/

---

# Using Code

* When using other code within your own, you create a derived work
* Must have some sort of permission to create the derived work
    * Or to make copies of the derived work, at the very least
* Must make sure you follow the license terms of the code you use
* For GPL licensed code, you must make your code GPL as well
    * Unless you do not redistribute any copies
* For BSD licenses, you need not make your own code BSD
    * Don't even have to make your code available
    * For practical reasons, most people contribute back

---

# Combining Licenses

* GPL license requires code you combine to be GPL
* FSF keeps a [list of GPL-compatible licenses](http://www.fsf.org/licensing/licenses/index_html#SoftwareLicenses)
* GPLv2 and GPLv3 have some [compatibility issues](http://www.gnu.org/licenses/gpl-faq.html#AllCompatibility)
* BSD licenses allow you to use code under non-BSD licenses
    * Can be more restrictive
* Some code can be dual licensed
    * Recipient can chose among 2 (or more) licenses
    * Licenses need not be compatible
        * But any external code used must be compatible with both

---

# Not Just For Code

* FLOSS-like licenses for other things exist
* [GNU Free Documentation License](http://www.gnu.org/copyleft/fdl.html)
    * Generally not recommended any more
* [Creative Commons](http://creativecommons.org) [licenses](http://creativecommons.org/about/licenses/)
    * This presentation is released under the CC-By license

---

# Creative Commons

* "Some Rights Reserved"
* Recognizes importance of shared cultural artifacts
    * Creates a voluntary "commons" of creative works that can be used by others
    * Makes it easier to share and build upon the work of others
* Provides licenses you can apply to your copyrighted works
    * Takes copyright laws into consideration

---

# Creative Commons Licenses

* Mix and match to fit your goals
    * Require attribution
    * Optional restrictions on commercial use
    * Optionally allow modifications
    * Optionally require modifications to be shared

???

* Several search sites allow searching for CC-licensed images
    * Google
    * Flickr
* CC0 is effectively releasing into the public domain

---

# Infringement Penalties

* Actual damages
* Potential for punitive damages, if you intentionally keep violating
* Potential for statutory damages
    * Only if the work was registered with US Copyright Office
        * Within 3 months of publication
* Injunction preventing you from distributing potentially infringing code
* Profits you've made from the infringing material

???

---

# Summary

* Using FLOSS has no restrictions/requirements
    * But commercial software usually does
* You must follow terms of copyright law and licenses
    * If you distribute copies or make modifications
* Open Source licenses give you additional rights
    * Commercial EULAs take rights away
* GPL requires derivative works to remain free/open under GPL
    * BSD-like licenses allow use in closed commercial works

---

# Shorter Summary

* Using Open Source - no worries
* Distributing Open Source - no worries
* Modifying and distributing Open Source with source code - no worries
* Mixing Open Source with proprietary extensions - talk to a lawyer
    * Unless the Open Source code is BSD or MIT
        * Then just ensure proper attribution

---

# Further Exploration

* Read the licenses - GPL, BSD, Microsoft EULAs
* Read the copyright laws
* Check out the [Copyright.gov](http://copyright.gov) materials

---

# Resources

* [US Copyright Office (Copyright.gov)](http://copyright.gov)
    * [FAQ](http://www.copyright.gov/help/faq/)
    * [Basics](http://www.copyright.gov/circs/circ1.html)

---

# Presentation Info

* http://craigbuchek.com/presentations
* Copyright 2003, 2006, 2007, 2008, 2009, 2020 by Craig Buchek; Some Rights Reserved
* This work is licensed under the [Creative Commons](http://creativecommons.org/) [Attribution License](http://creativecommons.org/licenses/by/3.0/)
