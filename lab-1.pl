numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

eval(s(X+Y),s(Z)) :- eval(X,A), eval(Y,B), add(A,B,Z),!.
eval(X+Y,Z) :- eval(X,A), eval(Y,B), add(A,B,Z),!.
eval(X,X):- numeral(X).

add2(X,Y,Z) :- eval(X,A),eval(Y,B),add(A,B,Z).