%Lists

member_of(X,[X|_]).
member_of(X,[_|Tail]) :- member_of(X,Tail).

concat_lists([], List, List).
concat_lists([Elem | List1], List2, [Elem | List3]) :-
		concat_lists(List1, List2, List3).

/** <examples>
 
?- member_of(a,[a,b,c]).
?- member_of(X,[a,b,c]).
?- concat_lists([1, 2, 3], [d, e, f, g], X).
?- concat_lists(X, Y, [a, b, c, d]).

*/

all_a([]).
all_a([a|L]):- all_a(L).

element_of(X,[X|_]).
element_of(X,[_|Tail]) :- element_of(X,Tail).

trans_a_b([], []).
trans_a_b([C1|Tail1], [C2|Tail2]) :- C1 = a, C2 = b, trans_a_b(Tail1, Tail2).

scalarMult(_, [], []).
%scalarMult(X, [H|Tail], R) :- Aux is X * H, scalarMult(X, Tail, [Aux|R]). nu e bine
scalarMult(X, [H|Tail], R) :- Aux is X * H, scalarMult(X, Tail, R1), R = [Aux|R1].

dot([], [], 0).
dot([H1|T1], [H2|T2], R) :- Aux is H1 * H2, dot(T1, T2, R1), R is Aux + R1.

max([], -1).
max([H|T], R) :-  max(T, R1), ((H > R1, R is H) ; (H =< R1, R is R1)).

/*
max1([], -1).
max1([H|T], R) :- (H > R, max(T, H)) ; (H =< R, max(T, R)).
nu merge decat pe bool
*/

reverse1([], []).
reverse1([H|T], R) :- reverse1(T, R1), append(R1, [H], R).

palindrome1(L) :- reverse(L,R), L == R.

palindrome2(L) :- reverse1(L, R), L == R.

splitfl(L,T,X) :- reverse(L, L1), L1 = [X|T1], reverse(T, T1).
pal1([]).
pal1([_]).
pal1([X,L]) :- splitfl(L,T,X), pal1(T).



remove_duplicates([], []).
remove_duplicates([H], [H]).
remove_duplicates([H|Tail], R) :- remove_duplicates(Tail, R1), R is [H|R1], (member_of(H, R1), R is R1).
/*
ceva nu merge
*/
