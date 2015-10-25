numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).

eval(s(p(X)),Y) :- eval(X,Y),!.
eval(p(s(X)),Y) :- eval(X,Y),!.
eval(s(X+Y),s(Z)) :- eval(X,A), eval(Y,B), add(A,B,C), eval(C,Z),!.
eval(p(X+Y),p(Z)) :- eval(X,A), eval(Y,B), add(A,B,C), eval(C,Z),!.
eval(X+Y,Z) :- eval(X,A), eval(Y,B), add(A,B,C), eval(C,Z),!.
eval(X,X):- numeral(X).

add2(X,Y,Z) :- eval(X,A),eval(Y,B),add(A,B,C), eval(C,Z).

neg(0,0) :- !.
neg(s(0), p(0)) :- !.
neg(p(0), s(0)) :- !.
neg(s(X),p(Y)) :- eval(X,A), neg(A,Y),!.
neg(p(X),s(Y)) :- eval(X,A), neg(A,Y),!.

minus(X, Y) :- eval(X,A), neg(A,B), eval(B,Y),!.