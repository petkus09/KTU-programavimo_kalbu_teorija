sum([], 0).

sum([Head| Tail], S) :-
	sum(Tail, Sum1),
	sum(Head, Sum2),
	S is Sum2 + Sum1.

sum([A|[]], A).
sum(A, A).