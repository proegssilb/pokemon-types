:- use_module(library(csv)).
:- use_module(pokemonTypeUtils, [looseTriangle/4]).

:- initialization(main).

main :-
	findall(row(SA, SB, SC), (
				 looseTriangle(1, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows),
	csv_write_file("loose1.csv", Rows),
	findall(row(SA, SB, SC), (
				 looseTriangle(2, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows2),
	csv_write_file("loose2.csv", Rows2),
	findall(row(SA, SB, SC), (
				 looseTriangle(3, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows3),
	csv_write_file("loose3.csv", Rows3),
	findall(row(SA, SB, SC), (
				 looseTriangle(4, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows4),
	csv_write_file("loose4.csv", Rows4),
	findall(row(SA, SB, SC), (
				 looseTriangle(5, A, B, C),
				  term_to_atom(A, SA),
				  term_to_atom(B, SB),
				  term_to_atom(C, SC)
				 ), Rows5),
	csv_write_file("loose5.csv", Rows5),
	halt.
