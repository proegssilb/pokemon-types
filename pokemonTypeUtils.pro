
:- module(pokemonTypeUtils, [checkgen/2, unspecified/3, strong/3, useless/3,
															weak/3, neutral/3, symmetric/3, perfectTriangle/4,
															triangle/4, looseTriangle/4
														]).
:- use_module(pokemonGen2).
:- use_module(pokemonGen1).

checkgen(Gen, TypeA) :-
	Gen = 1 -> gen1(TypeA);
	Gen = 2 -> gen2(TypeA).

unspecified(Gen, TypeA, TypeB) :-
	Gen = 1 -> (\+ strong1(TypeA, TypeB), \+ weak1(TypeA, TypeB),
							\+useless1(TypeA, TypeB));
	Gen = 2 -> (\+ strong2(TypeA, TypeB), \+ weak2(TypeA, TypeB),
							\+useless2(TypeA, TypeB), \+ neutral2(TypeA, TypeB)).

strong(Gen, A, B) :-
	checkgen(Gen, A),
	checkgen(Gen, B),
	(atom(A), atom(B)) -> (
		Gen = 1 -> strong1(A, B);
		Gen = 2 -> (strong2(A, B); unspecified(2, A, B), strong1(A, B))
	);
	([A1, A2] = A, [B1, B2] = B) -> (
		       strong(Gen, A1, B1), \+ weak(Gen, A1, B2);
		       strong(Gen, A2, B1), \+ weak(Gen, A2, B2);
		       strong(Gen, A1, B2), \+ weak(Gen, A1, B1);
		       strong(Gen, A2, B2), \+ weak(Gen, A2, B1)
		       );
	(atom(A), [B1, B2] = B) -> (
			strong(Gen, A, B1), \+ weak(Gen, A, B2);
			strong(Gen, A, B2), \+ weak(Gen, A, B1)
	);
	([A1, A2] = A, atom(B)) -> (
			strong(Gen, A1, B);
			strong(Gen, A2, B)
	).

useless(Gen, A, B) :-
	checkgen(Gen, A), checkgen(Gen, B),
	(atom(A), atom(B)) -> (
		Gen = 1 -> useless1(A, B);
		Gen = 2 -> (useless2(A, B); unspecified(2, A, B), useless1(A, B))
	);
	([A1, A2] = A, [B1, B2] = B) -> (
			useless(Gen, A1, B),
			useless(Gen, A2, B)
	);
	(atom(A), [B1, B2] = B) -> (
			useless(Gen, A, B1);
			useless(Gen, A, B2)
	);
	([A1, A2] = A, atom(B)) -> (
			useless(Gen, A1, B);
			useless(Gen, A2, B)
	).

weak(Gen, A, B) :-
	checkgen(Gen, A),
	checkgen(Gen, B),
	(atom(A), atom(B)) -> (
		Gen = 1 -> weak1(A, B);
		Gen = 2 -> (weak2(A, B); unspecified(2, A, B), weak1(A, B))
	);
	([A1, A2] = A, [B1, B2] = B) -> (
		       weak(Gen, A1, B1), \+ strong(Gen, A1, B2);
		       weak(Gen, A2, B1), \+ strong(Gen, A2, B2);
		       weak(Gen, A1, B2), \+ strong(Gen, A1, B1);
		       weak(Gen, A2, B2), \+ strong(Gen, A2, B1)
		       ),
	(atom(A), [B1, B2] = B) -> (
			weak(Gen, A, B1), \+ strong(Gen, A, B2);
			weak(Gen, A, B2), \+ strong(Gen, A, B1)
	);
	([A1, A2] = A, atom(B)) -> (
			weak(Gen, A1, B);
			weak(Gen, A2, B)
	).

neutral(Gen, A, B) :-
	checkgen(Gen, A), checkgen(Gen, B),
	(atom(A), atom(B)) -> (
			Gen = 1 -> unspecified(1, A, B);
			Gen = 2 -> neutral2(A, B); unspecified(2, A, B), unspecified(1, A, B)
	);
	([A1, A2] = A, [B1, B2] = B) -> (
			neutral(Gen, A1, B1),
			neutral(Gen, A1, B2),
			neutral(Gen, A2, B1),
			neutral(Gen, A2, B2)
	);
	(atom(A), [B1, B2] = B) -> (
			neutral(Gen, A, B1),
			neutral(Gen, A, B2)
	);
	([A1, A2] = A, atom(B)) -> (
			neutral(Gen, A1, B),
			neutral(Gen, A2, B)
	).

symmetric(Gen, A, B) :-
	strong(Gen, A, B), weak(Gen, B, A);
	weak(Gen, A, B), strong(Gen, B, A);
	useless(Gen, A, B), useless(Gen, B, A);
	neutral(Gen, A, B), neutral(Gen, B, A).

perfectTriangle(Gen, A, B, C) :-
	setof(A-B, (
		     checkgen(Gen, A), checkgen(Gen, B), A @< B,
		      symmetric(Gen, A, B), strong(Gen, A, B)),
	      Bis),
	member(A-B, Bis),
	setof(A-B-C, (
		      checkgen(Gen, C), A @< C, B \= C,
		      strong(Gen, B, C), strong(Gen, C, A),
					symmetric(Gen, B, C), symmetric(Gen, C, A)
		     ), Tris),
	member(A-B-C, Tris).

triangle(Gen, A, B, C) :-
	setof(A-B-C, (
		     checkgen(Gen, A), checkgen(Gen, B), checkgen(Gen, C),
				 	A @< B, A @< C, B \= C,
		      strong(Gen, A, B), strong(Gen, B, C), strong(Gen, C, A)
		     ), Tris),
	member(A-B-C, Tris).

looseTriangle(Gen, A, B, C) :-
	setof(A-B-C, (
					checkgen(Gen, A), checkgen(Gen, B), checkgen(Gen, C),
					 A @< B, A @< C, B \= C,
		      (   strong(Gen, A, B); weak(Gen, B, A)   ),
		      (   strong(Gen, B, C); weak(Gen, C, B)   ),
		      (   strong(Gen, C, A); weak(Gen, C, A)   )
		     ), Tris),
	member(A-B-C, Tris).
