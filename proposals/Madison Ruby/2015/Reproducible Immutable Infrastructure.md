Reproducible Immutable Infrastructure
=====================================

Description
-----------

Why is it so hard to deploy our applications? It doesn't have to be!

Let's start with provisioning servers. We can automate that, right?
We'll start with a standard Digital Ocean image, and customize it for our purposes.
We'll build out 3 types of servers: load balancer, app server, and database.

With that in place, we can implement immutable servers.
Any time we need to deploy, we can just provision a new set of servers.
This prevents snowflake servers, and keeps server configuration info with our app.
It also allows us to scale much more easily.


Why Me? Why This?
-----------------

I recently decide to start working on immutable servers for a side project. I discovered several tools, like Packer, that help make building VM images really simple. Given that and the Digital Ocean and DNSimple APIs, I found that I could completely automate the provisioning process. I could go from having only a domain name and accounts on those 2 services to having all my servers deployed in a couple minutes.

I'd been meaning to try implementing immutable servers for a while, and when I found this combination, it was a lot easier than I had expected. I'm hoping to share that with the community. Right now, I've got some custom code to build out my app's infrastructure, but I'll hopefully have that extracted to a gem by the time of the conference.

I'm considering doing this as a live demo, starting with no servers, and having an app running with a database and load balancers in 30 minutes. I'm not sure if that's reasonable yet, but it's one option I'll be considering.


Has this talk been given elsewhere?
-----------------------------------

I've proposed this for Burlington Ruby, but have not yet heard back from them.
