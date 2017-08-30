
:- module(pokemonTypeUtils, [checkgen/2, unspecified/3, strong/3, useless/3,
															weak/3, neutral/3, symmetric/3, perfectTriangle/4,
															triangle/4, looseTriangle/4, relationship/4
														]).
:- use_module(pokemonGen1).
:- use_module(pokemonGen2).
:- use_module(pokemonGen3).
:- use_module(pokemonGen4).
:- use_module(pokemonGen5).
:- use_module(pokemonGen6).

% use1(), use2() clarify which gens use which blocks of data.
use1(1).
use2(2).
use2(3).
use2(4).
use2(5).
use6(6).

% checkgen/2 is used to make sure a type exists in a given generation.
% This is primarily used for limiting which double-types are looked at.
checkgen(Gen, TypeA) :-
	Gen = 1 -> gen1(TypeA);
	Gen = 2 -> gen2(TypeA);
	Gen = 3 -> gen3(TypeA);
	Gen = 4 -> gen4(TypeA);
	Gen = 5 -> gen5(TypeA);
	Gen = 6 -> gen6(TypeA).

% unspecified indicates that in a given generation, the raw data recorded does
% not indicate what the relationship should be. In Gen 1, this means "neutral."
% In later gens, where "neutral" can be used to override a previous gen,
% "unspecified" means "use a previous gen's data".
unspecified(Gen, TypeA, TypeB) :-
	use1(Gen) -> (\+ strong1(TypeA, TypeB), \+ weak1(TypeA, TypeB),
					      \+useless1(TypeA, TypeB));
	use2(Gen) -> (\+ strong2(TypeA, TypeB), \+ weak2(TypeA, TypeB),
								\+useless2(TypeA, TypeB), \+ neutral2(TypeA, TypeB));
  use6(Gen) -> (\+ strong6(TypeA, TypeB), \+ weak6(TypeA, TypeB),
								\+neutral6(TypeA, TypeB)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% High-level type relationships.
% Use these functions as a consistent interface over the raw data.

strong(Gen, A, B) :-
	checkgen(Gen, A),
	checkgen(Gen, B), (
		(atom(A), atom(B)), (
			use1(Gen), strong1(A, B);
			use2(Gen), (strong2(A, B); unspecified(2, A, B), strong1(A, B));
			use6(Gen), (strong6(A, B); unspecified(6, A, B), strong2(A, B);
										unspecified(6, A, B), unspecified(2, A, B), strong1(A, B))
		);
		([A1, A2] = A, [B1, B2] = B, atom(A1), atom(A2), atom(B1), atom(B2)), (
			       strong(Gen, A1, B1), \+ weak(Gen, A1, B2);
			       strong(Gen, A2, B1), \+ weak(Gen, A2, B2);
			       strong(Gen, A1, B2), \+ weak(Gen, A1, B1);
			       strong(Gen, A2, B2), \+ weak(Gen, A2, B1)
			       );
		(atom(A), [B1, B2] = B, atom(B1), atom(B2)), (
				strong(Gen, A, B1), \+ weak(Gen, A, B2);
				strong(Gen, A, B2), \+ weak(Gen, A, B1)
		);
		([A1, A2] = A, atom(B), atom(A1), atom(A2)), (
				strong(Gen, A1, B);
				strong(Gen, A2, B)
		)
	).

useless(Gen, A, B) :-
	checkgen(Gen, A), checkgen(Gen, B), (
		(atom(A), atom(B)), (
			use1(Gen) -> useless1(A, B);
			use2(Gen) -> (useless2(A, B); unspecified(2, A, B), useless1(A, B));
			% Gen 6 doesn't declare useless6.
			use6(Gen) -> (useless6(A, B); unspecified(6, A, B), useless2(A, B);
			              unspecified(2, A, B), useless1(A, B))
		);
		([A1, A2] = A, [B1, B2] = B, atom(A1), atom(A2), atom(B1), atom(B2)), (
				useless(Gen, A1, B),
				useless(Gen, A2, B)
		);
		(atom(A), [B1, B2] = B, atom(B1), atom(B2)), (
				useless(Gen, A, B1);
				useless(Gen, A, B2)
		);
		([A1, A2] = A, atom(B), atom(A1), atom(A2)), (
				useless(Gen, A1, B);
				useless(Gen, A2, B)
		)
	).

weak(Gen, A, B) :-
	checkgen(Gen, A),
	checkgen(Gen, B), (
		(atom(A), atom(B)), (
			use1(Gen), weak1(A, B);
			use2(Gen), (weak2(A, B); unspecified(2, A, B), weak1(A, B));
			use6(Gen), (weak6(A, B); unspecified(6, A, B), weak2(A, B);
										unspecified(6, A, B), unspecified(2, A, B), weak1(A, B))
		);
		([A1, A2] = A, [B1, B2] = B, atom(A1), atom(A2), atom(B1), atom(B2)), (
	       weak(Gen, A1, B1), \+ strong(Gen, A1, B2);
	       weak(Gen, A2, B1), \+ strong(Gen, A2, B2);
	       weak(Gen, A1, B2), \+ strong(Gen, A1, B1);
	       weak(Gen, A2, B2), \+ strong(Gen, A2, B1)
	       );
		(atom(A), [B1, B2] = B, atom(B1), atom(B2)), (
				weak(Gen, A, B1), \+ strong(Gen, A, B2);
				weak(Gen, A, B2), \+ strong(Gen, A, B1)
		);
		([A1, A2] = A, atom(B), atom(A1), atom(A2)), (
				weak(Gen, A1, B);
				weak(Gen, A2, B)
		)
	).

neutral(Gen, A, B) :-
	checkgen(Gen, A), checkgen(Gen, B), (
		(atom(A), atom(B)), (
				use1(Gen), unspecified(1, A, B);
				use2(Gen), (neutral2(A, B);
											unspecified(2, A, B), unspecified(1, A, B));
				use6(Gen), (neutral6(A, B);
											unspecified(6, A, B), neutral2(A, B);
											unspecified(6, A, B), unspecified(2, A, B),
												unspecified(1, A, B))
		);
		([A1, A2] = A, [B1, B2] = B, atom(A1), atom(A2), atom(B1), atom(B2)), (
				neutral(Gen, A1, B1),
				neutral(Gen, A1, B2),
				neutral(Gen, A2, B1),
				neutral(Gen, A2, B2)
		);
		(atom(A), [B1, B2] = B, atom(B1), atom(B2)), (
				neutral(Gen, A, B1),
				neutral(Gen, A, B2)
		);
		([A1, A2] = A, atom(B), atom(A1), atom(A2)), (
				neutral(Gen, A1, B),
				neutral(Gen, A2, B)
		)
	).

% Strong, weak, useless, and neutral are one-way effectiveness relationships.
% "symmetric" establishes that the relationship between A and B is "even", "fair",
% or "bidirectional" -- that similar things happen in both directions.
symmetric(Gen, A, B) :-
	strong(Gen, A, B), weak(Gen, B, A);
	weak(Gen, A, B), strong(Gen, B, A);
	useless(Gen, A, B), useless(Gen, B, A);
	neutral(Gen, A, B), neutral(Gen, B, A).

% A "perfect triangle" has all-symmetric relationships, and has strong
% effectiveness A -> B -> C -> A.
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

% A "triangle" has one-way strong relationships.
triangle(Gen, A, B, C) :-
	setof(A-B-C, (
		     checkgen(Gen, A), checkgen(Gen, B), checkgen(Gen, C),
				 	A @< B, A @< C, B \= C,
		      strong(Gen, A, B), strong(Gen, B, C), strong(Gen, C, A)
		     ), Tris),
	member(A-B-C, Tris).

% A "loose triangle" either has strong relationships forwards, or weak relationships
% backward at each link.
looseTriangle(Gen, A, B, C) :-
	setof(A-B-C, (
					checkgen(Gen, A), checkgen(Gen, B), checkgen(Gen, C),
					 A @< B, A @< C, B \= C,
		      (   strong(Gen, A, B); weak(Gen, B, A)   ),
		      (   strong(Gen, B, C); weak(Gen, C, B)   ),
		      (   strong(Gen, C, A); weak(Gen, C, A)   )
		     ), Tris),
	member(A-B-C, Tris).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% "relationship" figures out what the relationship is between two types.
% Instead of figuring out that A is strong vs B, or what types B is weak to,
% it figures out that A -> B is strong or weak. This goal can be used to figure
% out other queries as well.
relationship(Gen, A, B, Rel) :-
	Rel = strong, strong(Gen, A, B);
	Rel = weak, weak(Gen, A, B);
	Rel = useless, useless(Gen, A, B);
	Rel = neutral, neutral(Gen, A, B).
