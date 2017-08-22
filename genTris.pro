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
	findall(row(SA, SB, SC), (
				 triangle(3, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows3),
	csv_write_file("triangles3.csv", Rows3),
	findall(row(SA, SB, SC), (
				 triangle(4, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows4),
	csv_write_file("triangles4.csv", Rows4),
	findall(row(SA, SB, SC), (
				 triangle(5, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows5),
	csv_write_file("triangles5.csv", Rows5),
	halt.
