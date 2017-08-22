:- use_module(library(csv)).
:- use_module(pokemonTypeUtils).

:- initialization(main).

main :-
	findall(row(SA, SB, SC), (
				 perfectTriangle(1, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows),
	csv_write_file("perfect1.csv", Rows),
	findall(row(SA, SB, SC), (
				 perfectTriangle(2, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows2),
	csv_write_file("perfect2.csv", Rows2),
	findall(row(SA, SB, SC), (
				 perfectTriangle(3, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows3),
	csv_write_file("perfect3.csv", Rows3),
	findall(row(SA, SB, SC), (
				 perfectTriangle(4, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows4),
	csv_write_file("perfect4.csv", Rows4),
	findall(row(SA, SB, SC), (
				 perfectTriangle(5, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows5),
	csv_write_file("perfect5.csv", Rows5),
	halt.
