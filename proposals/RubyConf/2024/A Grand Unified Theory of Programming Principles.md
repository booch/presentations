# PROPOSAL: A Grand Unified Theory of Programming Principles

Talk type: 30-45-minute lecture-style

## Title

* Subtitle
    * Further Explorations into Connascence [TODO: Sp?]

## Concept

Jim Weirich helped us understand a lot about how to use Ruby better.
He gave a couple talks on "connaissance" [TODO: Sp?] to give us some good heuristics on how to make code more "economical". We want TODO:tighter/losser connaisance.

## Notes

* Jim's example of old Rails `find(:first)` and `find(:all)` returning different types of results
    * `uniq` has a similar issue -- it doesn't run the block at all if there's only 1 element
        * I suppose that could be seen as a short-circuit though, like `&&` and `||` implement
* How does DRY fit in?
* How to SOLID principles fit in?
* Does using methods to generate routes/URLs in Rails really help?
