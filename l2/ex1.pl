distance((XA, YA), (XB, YB), X) :- X is sqrt((XA-XB)**2 + (YA-YB)**2).
 
 /*
 fib(0,1).
 fib(1,1).
 fib(N,X) :- N1 is N-1, N2 is N-2, fib(N2,F2), fib(N1,F1), X is F1+F2.
 */
 
fib(N,X) :- fib(N,_, X).
fib(0, 1, 1).
fib(1, 1, 1).
fib(N, F2, Y) :- N1 is N - 1, fib(N1, F1, F2), Y is F1 + F2.

line(0, _).
line(N, C) :- N1 is N - 1, write(C), line(N1, C).
/*line(N, C) :- N1 is N - 1, write(C), line(N1, C), nl. (randurile libere se pun la sf, dupa apelul recursiv)
*/

