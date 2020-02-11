Everything You Need to Know About Passwords
===========================================

Abstract
--------

What you don't know about passwords could hurt you - and your users!

This session will cover all the basics of password authentication:

* What makes a good password?
* How do we ensure users have good passwords?
* How do we keep our passwords safe?
* How do we keep our users' passwords safe, even if we get hacked?


Details
-------

NOTE FOR REVIEWERS: I could use some advice on which order the bullet-points should go in: should the middle 2 be swapped, or left as is? I'd also be open to suggestions for a different title.

I plan to cover a lot (as I typically do in my talks). All these should basically serve to answer the 4 questions in the abstract.

* Authentication versus authorization
* How to choose a good password
    * Characters
    * Length
    * Memorization
    * Phrases
    * 4-6 random words
        * correct horse stapler battery
* Password managers
    * Use them!
    * Back them up!
* Password hashing
    * Use Scrypt, Argon2, Bcrypt, or PBKDF2
    * Use salt and pepper
    * We want a *slow* hashing algorithm
        * Don't use SHA or MD5!
            * Unless you can use millions of rounds and a salt
    * A very short detour on encryption
        * Private key versus public key
        * Encrypting/decrypting
        * Encryption versus HMAC (hashing)
            * Mostly to distinguish the 2 purposes
* Password policies
    * Great
        * Shows strength of your new password as you type it
    * Good
        * Lenient, as long as the password is strong
    * Bad
        * Complicated rules
    * Ugly
        * Short maximum password length
* Password rotation
    * Dangers of forcing them too often
* Password resets
    * Can easily make your password strength irrelevant
    * Subject to social engineering
    * What if I've lost access to my email?
* Shared passwords
    * Don't!
* Multi-factor authentication
    * Alternatives to passwords
* Encryption
    * Only as far as it applies to passwords in flight

I'm sure the hardest part will be fitting most of that in, and figuring out what I can leave out.


Pitch
-----

I think there are a lot of people out there not really grounded in the basics of passwords. We still have apps that store passwords in plain text, and will email your password to you. We still have apps that don't let you have long passwords, but force you into complicated rules about what characters your password should contain. We need people to understand the importance of good password hygiene, to prevent more incidents exposing millions of users to having their accounts stolen.

This seems like a generic talk, and it definitely is, because these basics are important no matter what language or framework we're using. But I think it's very important that every developer learn about this topic, so as not to be dangerous. This would be a brand new talk; I've not presented on this topic in a long time. The description of the *Identity & Permissions* track is what inspired me to write up this proposal, since it's something that fits the kind of talk I do best. I've been using Ruby and Rails for 15 years, so I will definitely include plenty of details that are specific to Ruby and Rails.

My best talks are ones where I'm teaching, making sure that people have a thorough understanding of the topic. This is definitely that kind of talk.
