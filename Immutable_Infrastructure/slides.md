class: title, middle, center

# Immutable Infrastructure

* by Craig Buchek


* Madison+ Ruby Conference
* August 22, 2015


http://tinyurl.com/madruby-ii


---

Feedback
========

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github] (personal, presentations)
* GitHub: [boochtek][github-boochtek] (projects)
* Email: craig@boochtek.com

---

About Me
========

* Independent web developer
  * [BoochTek][boochtek]
* Ruby / Rails programmer since 2006
  * Network and System Admin before that
* Agile practitioner
  * [This Agile Life][tal] podcast
* Boring slide designer

---

Snowflake Servers
=================

* Config changes are made manually
  * Changes aren't fully documented
  * People make mistakes
* Every server is different

???

* Who here has servers they're afraid to make changes to?
  * Why?
    * Brittle
    * Configured incorrectly / inconsistently / oddly
* Who's confident they could rebuild their servers in under 10 minutes?
  * Or at least their ops people could?
* Difficult to replace

---

Phoenix Servers
===============

* Burn down your servers periodically
* Rebuild them from documentation

???

* Doesn't solve all of the problems:
  * Mistakes are still made
  * Things still don't get documented
* A recent project I worked on:
  * I had to troubleshoot every time a new server was built
    * Had 4 environments, for 3 "brandings" of the app
    * Different proxy settings
    * Varnish not running on some
    * Incorrect environment variables
    * Incorrect Tomcat settings
  * No visibility into the configuration
    * I've got enough admin experience that I could troubleshoot, if I could see it
    * Had to guess at the problem from the logs
      * Or add code to log the settings, where possible

---

Immutable Servers
=================

* Once you've built it, don't make changes
* If you need changes, just build a new server

???

* Also called "immutable infrastructure"
  * That could imply networking too, but usually does not, other than load balancers
* Solves the snowflake problem

---

Pets v. Cattle
==============

* Pets
  * We treat each as an individual
    * Each has its own unique name
  * When they get sick, we make sure they're cared for
  * We're emotionally invested


* Cattle
  * We treat them as a group
    * They're all nearly identical
  * We tag them with numbers
  * When they get sick, we replace them
  * We're NOT emotionally invested

???

* Great analogy
* Originally by someone at Microsoft
  * First popularized by a talk by someone from CERN
* Treat your servers like cattle, not pets
  * Virtualization required to get us to this point
* Treat your development box like a pet
  * Or not -- being able to replace it should be quick and painless too!
  * Then maybe your phone and iPad?
* Anyone have examples of systems we SHOULD treat as pets?

---

Automation
==========

* Consistency
* Repeatability
* Quicker feedback loops
* Self-documenting

???

* Immutable servers requires complete automation of the server provision/build process
* Solves the problem of documentation:
  * It's not on any server, unless it's in the build automation

---

Benefits
========

* Prevents snowflake servers
* Reproducible
* Versioned
* Easier scalability
* Control
* Easier to smoke test before going live

---

Disadvantages
=============

* Takes longer to deploy
* Cost
  * More VMs required
* Have to maintain your own servers
  * Have to apply your own security patches
* Requires **true** DevOps

???

* With Digital Ocean VMs as low as $5 per month, cost isn't a big issue
  * You can probably implement this cheaper than Heroku
* True DevOps
  * Developers and operations truly working together
  * Trust between the 2 "sides"
  * No separation of duties
    * Many companies think Sarbanes-Oxley requires this
      * But SOx only applies to accounting and executives
    * This **might** be a good security practice though

---

Prerequisites
=============

* Virtual machines (VMs)
* Load balancers (LBs)
  * Use HAProxy
* APIs
  * Provisioning
  * DNS

???

* You might get away without the load balancers, with a few caveats
  * Potential downtime
  * Have to leave old servers up until DNS caches drain
* HAProxy is great for load balancing
  * Free
  * Deploy it to your own servers
  * As powerful as most $10k commercial offerings
  * Can understand and configure in just a couple days

---

Getting There
=============

1. Document the server build process
2. Write shell scripts to semi-automate the process
  * Or configuration management tools
3. Find a tool to fully automate the process
4. Iterate

???

* I'll talk about configuration management tools in a later slide

---

Tools
=====

* Atlas, Terraform, and Packer
* Cobbler, Spacewalk, Red Hat Satellite
* [AWS CloudFormation][aws-cloudformation]
* Salt Cloud
* [Foreman][foreman], Katello, Puppet Razor
* Docker (and its ecosystem of tools)

???

* Atlas, Terraform, and Packer are from HashiCorp
  * Same company that makes Vagrant
  * Packer and Terraform are free
  * Atlas is $40 per node per month
    * Free for up to 10 nodes

---

Config Management
=================

* Why not just configuration management?
  * Ansible
  * Chef
  * Puppet
* They don't capture every possible change
* They make your servers mutable, by design

???

* You could use these to configure your servers at deploy time
  * Packer allows this (or shell scripts)
* I find shell scripts easier to work with
* A hybrid approach might make sense though
  * Use CM tools to roll out security patches and package updates

---

Docker
======

* Docker itself doesn't quite do this for us
  * Still have to manage provisioning servers
  * Adds another layer for the docker images
  * Have to manage connecting everything together
* Docker ecosystem has tools to manage images
  * Fleet, Kubernetes, Mesos

???

* There's a lot to learn to use Docker
* I'm not saying don't use Docker
  * I'm saying to start with something simpler
  * I don't think that 80% of apps need the complexity of Docker

---

Provisional
===========

* What's the simplest thing that could work?

1. Start with a base image
2. Add files to that image
3. Run shell scripts to install and configure
4. Provision servers with the new image

???

* I started using Packer
  * It seemed a bit complicated
  * Wasn't sure if I should also learn Terraform and Atlas
* Then I decided to write my own, that was easier to use

---

Provisional Config
==================

~~~ yml
domain: <%= ENV["DOMAIN"] %>
vps:
  provider: digital-ocean
  api_key: <%= ENV["DIGITAL_OCEAN_API_KEY"] %>
  defaults:
    region: nyc3
    size: 512mb
    backups: true
    private_networking: true
    ipv6: true
    locked: false
~~~

---

Provisional Config - Images
===========================

~~~ yml
images:
  base:
    base-image: debian-8-x64
  lb:
    base-image: base
  app:
    base-image: base
  db:
    base-image: base
~~~

---

Provisional Config - Deployments
================================

~~~ yml
deployments:
  staging:
    lb:
      servers: 1
      cold-only: true
    app:
      servers: 2
    db:
      servers: 1
      cold-only: true
      size: 2gb
~~~

---

Provisional - Build Images
==========================

~~~ bash
provisional image list
provisional image build base
provisional image build lb
provisional image build app
provisional image build db
~~~

---

Provisional - Deploying
=======================

~~~ bash
provisional server list
provisional deploy --cold staging
provisional server list staging
~~~

---

More Extensive Provisional Configuration
========================================

* More environments
* Staggered deployments
* TLS or VPN between components
* Redundant load balancers
* Static assets servers
* Bastion host
* Logging host
* Put Varnish in front of app servers and/or LBs
* TDD using Serverspec
* Clustered DB servers

???

* Staggered deployments - latest version (`n`) running in parallel with `n-1`
* Will initially configure logs to go to Syslog running on DB server
* Serverspec is used to prove that images are configured as we think

---

Provisional Enhancements
========================

* Adapters to support Amazon AWS, etc.
* Adapters to support DynDNS, etc.

???

* There's a lot more work to be done to make the tool generally useful

---

Issue - Sensitive Data
======================

* Passwords
  * Pre-hash the passwords, where we're the server
* API keys
  * We could use a vault of some support
    * HashiCorp Vault (distributed, complicated)
    * Ansible Vault
    * PGP

---

Issue - SSL Certificates
========================

* Not sure of an API for requesting TLS certificates


* [Let's Encrypt][letsencrypt] should solve this
  * Free
  * Works with Apache and Nginx

???

* Two issues:
  * Certificate for public front-end load balancer
  * Certificates for communication between load balancer and app servers
* If there's an API, I expect it'd only be for the expensive options
* Let's Encrypt scheduled to go live November 16, 2015
  * Runs an ACME agent to get and configure SSL cert
  * Will need to invalidate certificates when we decommission servers

---

Issue - SSH
===========

* Should we turn off SSH?

???

* Probably
  * If you want complete immutability
  * Security benefits
* Maybe not
  * Makes troubleshooting easier
  * Required for "push" CM tools, like Ansible
  * Use a bastion host if you do keep SSH enabled
* Possible compromise: port knocking

---

Issue - Reverse Engineering
===========================

* Can't we generate configs from existing servers?
  * DevStructure Blueprint

???

* Unfortunately, Blueprint has not been updated for 2 years

---

Then What?
==========

* What does this enable?
  * Ability to move between providers
  * More time to focus on higher-level operations concerns
  * Infrastructure automation scripts can be shared
    * App developers can use someone else's configs

---

Extending the Idea
==================

* Docker containers instead of (or in addition to) VMs
* Can we do this for our database infrastructure?

---

More Ideas
==========

* Blue-green deployments
* Monitoring and reacting to server health
  * Scaling up/down, depending on traffic
  * Replacing servers with problems

???

* The ultimate in monitoring and reaction is Netflix' Chaos Monkey

---

Further Info
============

* Martin Fowler's Bliki articles:
  * [SnowflakeServer][bliki-snowflakeserver]
  * [PhoenixServer][bliki-phoenixserver]
  * [ImmutableServer][bliki-immutableserver]
  * [BlueGreenDeployment][bliki-bluegreen]
* ThoughtWorks articles:
  * [Moving to the Phoenix Server Pattern - Part 1][moving-to-phoenix-1]


---

Colophon
========

* [Remark][remark] - JavaScript slide show from Markdown

---

Call to Action
==============

* Automate your provisioning and deployment
  * Use my stuff if you find it useful


1. Document the server build process
2. Write shell scripts to semi-automate the process
  * Or configuration management tools
3. Find a tool to fully automate the process
4. Iterate

???

* I'm not saying you should use my tool
  * I'm saying you should find a way to make this happen
* Everyone should be doing this in 2015 or 2016
* My server configs are probably more useful than the tool itself

---

Feedback
========

* Twitter: [@CraigBuchek][twitter]
* GitHub: [booch][github]
* Email: craig@boochtek.com


* Provisional: https://github.com/boochtek/provisional


* Slides: http://tinyurl.com/madruby-ii
* Slides: https://github.com/booch/presentations/



[twitter]: https://twitter.com/CraigBuchek
[github]: https://github.com/booch
[github-boochtek]: https://github.com/boochtek
[boochtek]: http://boochtek.com
[tal]: http://www.thisagilelife.com
[aws-cloudformation]: http://aws.amazon.com/cloudformation/
[foreman]: http://theforeman.org/

[letsencrypt]: https://letsencrypt.org

[bliki-snowflakeserver]: http://martinfowler.com/bliki/SnowflakeServer.html
[bliki-phoenixserver]: http://martinfowler.com/bliki/PhoenixServer.html
[bliki-immutableserver]: http://martinfowler.com/bliki/ImmutableServer.html
[bliki-bluegreen]: http://martinfowler.com/bliki/BlueGreenDeployment.html
[moving-to-phoenix-1]: http://www.thoughtworks.com/insights/blog/moving-to-phoenix-server-pattern-introduction
[remark]: http://remarkjs.com/
