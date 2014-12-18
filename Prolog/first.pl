nb(A, B, C) :-
	B mod A =\= 0,
	A =:= C.

nb(A, B, C) :-
	A mod B =\= 0,
	B =:= C.

nb(A, B, C) :-
	(A mod C =\= 0; B mod C =\= 0),
	nb(A, B, C+1).

zmogus(petras).