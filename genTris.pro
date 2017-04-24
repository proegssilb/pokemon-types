:- use_module(library(csv)).
:- use_module(pokemonTypeUtils).

:- initialization(main).

main :-
	findall(row(SA, SB, SC), (
				 triangle(1, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows),
	csv_write_file("triangles1.csv", Rows),
	findall(row(SA, SB, SC), (
				 triangle(2, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows2),
	csv_write_file("triangles2.csv", Rows2),
	halt.
