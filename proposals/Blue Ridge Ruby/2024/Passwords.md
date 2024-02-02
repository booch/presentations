# Everything You Need to Know About Passwords

## Elevator Pitch (300 characters)

Many devs don't really know the basics of passwords and the importance of good password hygiene.
We still see incidents exposing millions of passwords.
We still have apps that have complicated password rules, but don't allow long passwords.
Let's help fix this.


## Abstract

What you don't know about passwords could hurt you — and your users!

This session will cover all the basics of password authentication:

* What makes a good password?
* How do we keep our passwords safe?
* How do we ensure users have good passwords?
* How do we keep our users' passwords safe, even if we get hacked?


## Details

I plan to cover a lot (as I typically do in my talks).
All these should basically serve to answer the 4 questions in the abstract.

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
    * Salt, pepper, and nonces
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
    * Use a password manager
* Multi-factor authentication
    * Alternatives to passwords
        * Passkeys
* Encryption
    * Only as far as it applies to passwords in flight

I'm sure the hardest part will be fitting most of that in,
and figuring out what I can leave out.

This seems like a generic talk, and it definitely is,
because these basics are important no matter what language or framework we're using.
But I think it's very important that every developer learn about this topic,
so as not to be dangerous.
This would be a brand new talk; I've not presented on this topic in a long time.
I've been using Ruby and Rails for 15 years, so I will definitely include plenty of details that are specific to Ruby and Rails.

My best talks are ones where I'm teaching, making sure that people have a thorough understanding of the topic.
Several of them even have "Everything You Need To Know About" in the title.
This is definitely that kind of talk.
