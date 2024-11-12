# Slides that were cut from the presentation

I couldn't bear to not keep this around for posterity.
I'm sure I'll find a use for it later.
And I don't want to have to dig into git history to find it.

---
![bg width:100%](assets/As-We-May-Think-top-drawing.jpg)
![RubyConf 2024 doodle](assets/RubyConf-2024-background-doodle-2.png)
# 1942: As We May Think

<!-- 
- 1945: As We May Think
    - _The Atlantic_ magazine, July 1945
    - Engelbart read it in 1945 and again in 1961
        - Inspired him to design a sort of memex!
        - Wrote "A Conceptual Framework for the Augmentation of Man's Intellect"
            - 1963
- Vannevar Bush
    - Engineer
        - Analog computers
            - Differential equation solvers
    - MIT
        - PhD
        - Dean of Engineering
    - Lots of government science agencies
        - Head of NACA (NASA's predecessor)
        - Organization overseeing Manhattan Project
            - Was in the 2023 Oppenheimer movie
    - Founded Raytheon
- memex (memory expansion)
    - store all of your books, records, and communications
    - desk with microfilm screens
    - supplement memory
    - shared and collective memories
    - associative indexing "trails" of research
- Innovative ideas
    - hypertext
    - personal computers
    - Internet/Web
    - speech recognition
    - online encyclopedias
    - information science/processing/work/society/literacy
    - information overload
- Ted Nelson referred to it when he conceived "hypertext" in 1960
- Primary sources:
    - https://www.theatlantic.com/magazine/archive/1945/07/as-we-may-think/303881/
        - paywalled
    - https://cdn.theatlantic.com/media/archives/1945/07/176-1/132407932.pdf
    - https://www.w3.org/History/1945/vbush/vbush.shtml
    - Abridged version in _Life_ magazine, September 10, 1945
        - https://worrydream.com/refs/Bush_1945_-_As_We_May_Think_(Life_Magazine).pdf
        - Adds some drawings
    - https://dougengelbart.org/pubs/augment-133183-AHI-Vistas.html
- Photo credit: https://www.michaeljkramer.net/wp-content/uploads/2021/09/Bush_The-Memex.jpg
- Photo credit (memex): https://erinkmalone.medium.com/foreseeing-the-future-the-legacy-of-vannevar-bush-c418edc9a4ee
-->

---
# Simula 67

~~~ simula-67
Class Rectangle (Width, Height); Real Width, Height;
                         ! Class with two parameters;
   Begin
      Real Area, Perimeter;  ! Attributes;

      Procedure Update;     ! Methods (Can be Virtual);
      Begin
         Area := Width * Height;
         Perimeter := 2*(Width + Height)
      End of Update;

      Boolean Procedure IsSquare;
         IsSquare := Width=Height;
      Update;               ! Life of rectangle started at creation;
    OutText("Rectangle created: "); OutFix(Width,2,6);
    OutFix(Height,2,6); OutImage
End of Rectangle;
~~~

<!--
- Or perhaps Simula 67 was the first OO language
    - Derived from ALGOL 60
        - Most languages we use today are ancestors of ALGOL 60
- "more" syntax than we see today
- but you can make everything out
    - types
    - instance variables
    - class keyword for user-defined types
    - methods
    - ...
- code source: https://staff.um.edu.mt/jskl1/talk.html
-->

---
# Simula 67

~~~ simula-67
Rectangle Class LocRectangle (X, Y); Integer X, Y;
Begin                                        ! More parameters;
   Boolean Tall;                             ! More attributes;
   Procedure Move (Dx, Dy); Integer Dx, Dy;  ! More methods;
   Begin
      X := X + Dx; Y := Y + Dy
   End of Move;
   Tall := Height > Width;
   OutText("Located at: "); OutFix(X,2,6); OutFix(Y,2,6); OutImage
End of LocRectangle;
~~~

<!--
- but you can make everything out
    - ... subclass inheriting from superclass
        - and adding more instance variables
- Simula 67
    - garbage collection
    - objects were processes
        - actor model
        - coroutines
            - no true parallelism
- code source: https://staff.um.edu.mt/jskl1/talk.html
-->

---

# Colophon

- [Marp](https://marp.app/) (https://marp.app/)
- [mise](https://mise.jdx.dev/) (https://mise.jdx.dev/)
- Source: https://github.com/booch/presentations/

---

> Technology is anything invented after you were born.

<cite>Alan Kay</cite>

<!--
- [read quote]
- TODO: Douglas Adams follow-on quote?
- TODO: There was some point I wanted to make here
-->

---

# Smalltalk-76
![Smalltalk-76 GUI](assets/Smalltalk-76-UI.jpg)

---
