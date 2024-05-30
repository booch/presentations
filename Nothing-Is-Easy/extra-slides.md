---
class: transition, extra-slides

# Extra Unused Slides

---

# ASIDE: Nil vs. Null

* In Ruby, `nil` is the only "null" value
* In other languages, `null` is a separate concept
    * In Java, `null` is a reference to no object
    * In C, `NULL` is a pointer to no memory address
    * In JavaScript, `null` is a reference to no object
    * In SQL, `NULL` is a special value that represents "no value"
    * In Lisp, `nil` is a symbol that represents "no value"

---

# Law of Demeter

* The Law of Demeter is a design guideline for object-oriented programming
* It's often summarized as "only talk to your immediate friends"
    * Don't talk to strangers
    * Don't talk to your friends' friends
    * Don't talk to your friends' friends' friends
* The safe navigation operator is often used to follow the Law of Demeter
* But it's not a silver bullet
    * It can lead to long chains of method calls
    * It can lead to "train wrecks"
* Sometimes it's OK to break the Law of Demeter
    * But it's a code smell
    * It's a sign that you might need to refactor

???

* TODO: More on the Law of Demeter
