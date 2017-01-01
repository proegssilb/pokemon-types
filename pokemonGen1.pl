use_module(library(csv)).

% Let's define some data first.

gen1(normal).
gen1(fire).
gen1(water).
gen1(electric).
gen1(grass).
gen1(ice).
gen1(fighting).
gen1(poison).
gen1(ground).
gen1(flying).
gen1(psychic).
gen1(bug).
gen1(rock).
gen1(ghost).
gen1(dragon).
% These are the double-type pokemon types that exist in Gen1. This
% listing is an optimization so that we don't try to list/compute
% types for pokemon that don't yet exist.
gen1((normal, flying)).
gen1((fire, flying)).
gen1((water, flying)).
gen1((grass, poison)).
gen1((grass, psychic)).
gen1((rock, flying)).
gen1((rock, ground)).
gen1((rock, water)).
gen1((bug, flying)).
gen1((bug, grass)).
gen1((bug, poison)).
gen1((poison, ground)).
gen1((poison, flying)).
gen1((ghost, poison)).
gen1((water, ice)).
gen1((water, fighting)).
gen1((water, poison)).
gen1((water, psychic)).
gen1((ice, psychic)).
gen1((ice, flying)).
gen1((electric, flying)).
gen1((electric, flying)).
gen1((dragon, flying)).


% 'strong(A, B)' is read 'Attack Type A is strong against pokemon of type B'
% 'weak' and 'useless' are read similarly; weak => A does half-damage to
% B, useless => A does no damage to B.

%normal type
strong1(fighting, normal).
weak1(normal, rock).
useless1(normal, ghost).

%fire
weak1(fire, fire).
strong1(water, fire).
weak1(fire, water).
strong1(fire, grass).
strong1(fire, ice).
strong1(fire, bug).
weak1(fire, rock).
weak1(fire, dragon).
weak1(grass, fire).
strong1(ground, fire).
weak1(bug, fire).
strong1(rock, fire).

%water
weak1(water, water).
weak1(water, grass).
strong1(water, ground).
strong1(water, rock).
weak1(water, dragon).
strong1(electric, water).
strong1(grass, water).
weak1(ice, water).

%electric
weak1(electric,electric).
weak1(electric, grass).
useless1(electric, ground).
strong1(electric, flying).
weak1(electric, dragon).
strong1(ground, electric).
weak1(flying, electric).

%grass
weak1(grass, grass).
weak1(grass, poison).
strong1(grass, ground).
weak1(grass, flying).
weak1(grass, bug).
strong1(grass, rock).
weak1(grass, dragon).
strong1(ice, grass).
strong1(poison, grass).
weak1(ground, grass).
strong1(flying, grass).
strong1(bug, grass).

%ice
weak1(ice, ice).
strong1(ice, flying).
strong1(ice, dragon).
strong1(fighting, ice).
strong1(rock, ice).

%fighting
weak1(fighting, poison).
weak1(fighting, flying).
weak1(fighting, psychic).
weak1(fighting, bug).
strong1(fighting, rock).
useless1(fighting, ghost).
strong1(flying, fighting).
strong1(psychic, fighting).
weak1(bug, fighting).
weak1(rock, fighting).

%poison
weak1(poison, poison).
weak1(poison, ground).
strong1(poison, bug).
weak1(poison, rock).
weak1(poison, ghost).
strong1(ground, poison).
strong1(psychic, poison).
strong1(bug, poison).

%ground
useless1(ground, flying).
weak1(ground, bug).
strong1(ground, rock).
weak1(rock, ground).

%flying
strong1(flying, bug).
weak1(flying, rock).
weak1(bug, flying).
strong1(rock, flying).

%psychic
weak1(psychic, psychic).
strong1(bug, psychic).

%bug
weak1(bug, ghost).
strong1(rock, bug).

%rock

%ghost
strong1(ghost, ghost).

%dragon
strong1(dragon, dragon).

%% Some helper functions for easier type querying.
strong1((A1, A2), (B1, B2)) :-
	gen1((A1, A2)),
	gen1((B1, B2)),(
		       strong1(A1, B1), \+ weak1(A1, B2);
		       strong1(A2, B1), \+ weak1(A2, B2);
		       strong1(A1, B2), \+ weak1(A1, B1);
		       strong1(A2, B2), \+ weak1(A2, B1)
		       ).

strong1(A, (B1, B2)) :-
	gen1(A), gen1((B1, B2)), (
				 strong1(A, B1), \+ weak1(A, B2);
				 strong1(A, B2), \+ weak1(A, B1)
				 ).

strong1((A1, A2), B) :-
	gen1(B), gen1((A1, A2)), (
				 strong1(A1, B);
				 strong1(A2, B)
				 ).

weak1((A1, A2), (B1, B2)) :-
	gen1((A1, A2)),
	gen1((B1, B2)),(
		       weak1(A1, B1), \+ strong1(A1, B2);
		       weak1(A2, B1), \+ strong1(A2, B2);
		       weak1(A1, B2), \+ strong1(A1, B1);
		       weak1(A2, B2), \+ strong1(A2, B1)
		       ).

weak1(A, (B1, B2)) :-
	gen1(A), gen1((B1, B2)), (
				 weak1(A, B1), \+ strong1(A, B2);
				 weak1(A, B2), \+ strong1(A, B1)
				 ).

weak1((A1, A2), B) :-
	gen1((A1, A2)), gen1(B), (
				 weak1(A1, B);
				 weak1(A2, B)
				 ).

useless1(A, (B1, B2)) :-
	gen1(A), gen1((B1, B2)), (
				 useless1(A, B1);
				 useless1(A, B2)
				 ).

neutral1(A, (B1, B2)) :-
	gen1(A), gen1((B1, B2)), (
				 strong1(A, B1), weak1(A, B2);
				 strong1(A, B2), weak1(A, B1);
				 neutral1(A, B1), neutral1(A, B2)
				 ).

neutral1(A, B) :-
	gen1(A), gen1(B), (
			  strong1(A, B), !, fail;
			  weak1(A, B), !, fail;
			  useless1(A, B), !, fail
			  ).

symmetric1(A, B) :-
	gen1(A), gen1(B), (
			  strong1(A, B), weak1(B, A);
			  useless1(A, B), useless1(B, A)
			  ).

perfectTriangle1(A, B, C) :-
	setof(A-B, (
		     gen1(A), gen1(B), A @< B,
		      symmetric1(A, B)),
	      Bis),
	member(A-B, Bis),
	setof(A-B-C, (
		      gen1(C), A @< C, B \= C,
		      symmetric1(B, C), symmetric1(C, A)
		     ), Tris),
	member(A-B-C, Tris).

triangle1(A, B, C) :-
	setof(A-B-C, (
		     gen1(A), gen1(B), gen1(C), A @< B, A @< C, B \= C,
		      strong1(A, B), strong1(B, C), strong1(C, A)
		     ), Tris),
	member(A-B-C, Tris).

looseTriangle1(A, B, C) :-
	setof(A-B-C, (
		     gen1(A), gen1(B), gen1(C), A @< B, A @< C, B \= C,
		      (   strong1(A, B); weak1(B, A)   ),
		      (   strong1(B, C); weak1(C, B)   ),
		      (   strong1(C, A); weak1(C, A)   )
		     ), Tris),
	member(A-B-C, Tris).

writePerfectTriangles1 :-
	findall(row(SA, SB, SC), (
				 perfectTriangle1(A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows),
	csv_write_file("perfect1.csv", Rows),
	halt.

writeTriangles1 :-
	findall(row(SA, SB, SC), (
				 triangle1(A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows),
	csv_write_file("triangles1.csv", Rows),
	halt.

writeLooseTriangles1 :-
	findall(row(SA, SB, SC), (
				 looseTriangle1(A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows),
	csv_write_file("loose1.csv", Rows),
	halt.


