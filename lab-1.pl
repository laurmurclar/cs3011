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