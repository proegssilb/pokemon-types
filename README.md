# pokemon-types
Some prolog to manipulate types and type relations from various pokemon games.

Currently, Gen1 (Red/Blue/Yellow) types are implemented, in pokemon1.pl. I will
eventually define Gen2 (Gold/Silver) in pokemon2.pl.

Results of running the prolog are in perfect1.csv, triangles1.csv, and loose1.csv.

I have defined three types of type triangles as follows:

  * A *perfect triangle* (A, B, C) means that types are strong (double or 
    quadruple damage) when read left to right, and weak (half or quarter damage)
    when read right to left. It is assumed there is a link between C and A, so
    that C is strong against A, and A is weak against C.
  
  * A *loose triangle* (A, B, C) requires either (A strong vs. B) or (B weak 
    vs. A). The other two relationships behave similarly.
    
  * A *triangle* (A, B, C) requires only that each type is strong vs. the next
    type, when read right to left.

Additionally, I have defined how to handle compound types, such as "Dragon, 
Flying". A type B is strong vs. a compound type (C1, C2) if B is strong vs. one
of C1 or C2, and not weak vs. the other. A similar definition exists for B being
weak to (C1, C2). 

In order for a type triangle with compound types to exist, we must also define 
(C1, C2) being strong/weak to B. Since the first type is supposed to represent 
an attack type, we can say that (C1, C2) is strong vs. B if either C1 or C2 is 
strong vs. B. For now, I have defined that (C1, C2) is weak vs B if either C1 
or C2 is weak to B. Both of these definitions are somewhat arbitrary, but
without them, you can't have a type triangle. 