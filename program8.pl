% rule
mortal(X) :- human(X).
% fact
human(fred).
human(bill).
human(lucy).

% family relations: father, mother
 
% father(X,Y) indicates that X is father of Y
father(john, jack).
father(jack, leon).
father(john, lisa).
father(john, rick).
father(leon, bill).
father(jack, tim).
 
% mother(X,Y) indicates that X is mother of Y
mother(lucy, jack).
mother(alice, bill).
mother(dana, alice).
 
% parent(X,Y) indicates that X is parent of Y
parent(X, Y) :- 
    father(X, Y);
    mother(X, Y).
 
% siblings(X,Y) holds if X,Y have common parent
siblings(X, Y) :-
    parent(Z, X),
    parent(Z, Y),
    not(X=Y).
 
% ancestor(A,X) if A is ancestor of X
ancestor(X, Y) :- % base case
    parent(X, Y).
ancestor(X, Y) :- % recursive case
    parent(Z, Y),
    ancestor(X, Z). % X is an ancestor of my parent Z

% app(A,B,C) holds if A, B, C are lists and C is the result of appending A with B
%
% app [] ys  = ys 
% app (X:xs) ys = x:(app xs ys)
% app (X:xs) ys = x:zs where zs = app xs ys

app([], Ys, Ys).
app([X|Xs], Ys, [X|Zs]) :- app(Xs, Ys, Zs).

% prefix(P, L) holds if P is a prefix of list L

prefix(P, L) :- app(P, _, L).

sufffix(S, L) :- app(_, S, L).

% sublist(S, L) holds if S is sublist of L

sublist(S, L) :-
    prefix(P, L),
    sufffix(S, P).


niceList(L) :-
    L = [_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_,_],
    subList([1,_,1,_1], L),
    subList([2,_,_,2,_,_,2], L),
    subList([3,_,_,_,3,_,_,_,3], L),
    subList([4,_,_,_,_,4,_,_,_,_,4], L),
    subList([5,_,_,_,_,_,5,_,_,_,_,_,5], L),
    subList([6,_,_,_,_,_,_,6,_,_,_,_,_,_,6], L),
    subList([7,_,_,_,_,_,_,_,7,_,_,_,_,_,_,_,7], L),
    subList([8,_,_,_,_,_,_,_,_,8,_,_,_,_,_,_,_,_,8], L),
    subList([9,_,_,_,_,_,_,_,_,_,9,_,_,_,_,_,_,_,_,_,9], L).