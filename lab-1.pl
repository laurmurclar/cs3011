numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).

eval(s(p(X)),Y) :- eval(X,Y),!.
eval(p(s(X)),Y) :- eval(X,Y),!.
eval(s(X),s(Y)) :- eval(X,Y),!.
eval(p(X),p(Y)) :- eval(X,Y),!.
eval(X+Y,Z) :- eval(X,A), eval(Y,B), add(A,B,C), eval(C,Z),!.
eval(X-Y,Z) :- eval(X,A), eval(Y,B), subtract(A,B,C), eval(C,Z),!.
eval(-(X),Y) :- eval(X,A),minus(A,Y),!.
eval(X,X):- numeral(X).

add2(X,Y,Z) :- eval(X,A),eval(Y,B),add(A,B,C), eval(C,Z).

neg(0,0) :- !.
neg(s(X),p(Y)) :- eval(X,A), neg(A,Y),!.
neg(p(X),s(Y)) :- eval(X,A), neg(A,Y),!.

minus(X, Y) :- eval(X,A), neg(A,B), eval(B,Y),!.

subtract(X,Y,Z) :- minus(Y,A), add2(X,A,Z).