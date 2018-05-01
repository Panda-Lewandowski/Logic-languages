domains
  	ilist = integer*.
  	
predicates
	member(integer, ilist).
	sum(ilist, integer).
	nth(integer, ilist, integer).
	min(ilist, integer).
	max(ilist, integer).
	reverse(ilist, ilist).
	reverse(ilist, ilist, ilist).
	sub_start(ilist, ilist).
	sublist(ilist, ilist).
	delete(ilist, integer, ilist).
	append(ilist, ilist, ilist).
	permutation(ilist, ilist).
	bubble(ilist, ilist).

clauses
	member(X, [X | _]).
	member(X, [_ | Tail]) :- 
   		 member(X, Tail).
   		 
   	sum([], 0):-!.
	sum([Head|Tail], Sum):-
   		sum(Tail, TailSum),
   		Sum = TailSum + Head.
   			
   	nth(0, [Elem|_], Elem):-!.
	nth(Index, _, _):-
   		Index < 0, !, fail.
	nth(Index, [_|Tail], Elem):-
   		NextIndex = Index - 1,
   		nth(NextIndex, Tail, Elem).
   			
   	min([MinElem], MinElem):-!.
	min([Head|Tail], MinElem):-
   		min(Tail, TailMinElem),
   		TailMinElem < Head, !, 
   		MinElem = TailMinElem;
		MinElem = Head.
		
	max([MaxElem], MaxElem):-!.
	max([Head|Tail], MaxElem):-
   		min(Tail, TailMaxElem),
   		TailMaxElem > Head, !, 
   		MaxElem = TailMaxElem;
		MaxElem = Head.
		
	reverse(List, ReverseList):-
   		reverse(List, [], ReverseList). 

	reverse([], Buffer, Buffer):-!.
	reverse([Head|Tail], Buffer, ReverseList):-
   		reverse(Tail, [Head|Buffer], ReverseList).
   	
   	sub_start([], _):-!.
	sub_start([Head|TailSub], [Head|TailList]):-
   		sub_start(TailSub, TailList).
	
	sublist(Sub, List):-
   		sub_start(Sub, List), !.
	sublist(Sub, [_|Tail]):-
   		sublist(Sub, Tail).
   		
   	delete([], _, []):-!.
	delete([Elem|Tail], Elem, ResultTail):-
   	delete(Tail, Elem, ResultTail), !.
	delete([Head|Tail], Elem, [Head|ResultTail]):-
   		delete(Tail, Elem, ResultTail).
   		
   	append([], List2, List2).
	append([Head|Tail], List2, [Head|TailResult]):-
   		append(Tail, List2, TailResult).
   		
   	permutation([X,Y|T],[Y,X|T]):-
                X > Y,!.
	permutation([X|T],[X|T1]):-
                permutation(T,T1).
	bubble(L,L1):-
     		permutation(L,LL),!, bubble(LL,L1). 
	bubble(L,L).
   		 
goal
	%member(7, [1, 2, 3, 5]).
	%sum([1,2,3,4,5], X).
	%nth(2, [1,2,3,4,5], X).
	%max([5,4,3,2,1], X).
	%reverse([1,2,3,5], X).
	%sublist([32,3], [1,2,3,4,5]).
	%delete([1,2,3,1,3,4,5,1,3,1,3,1], 1, X).
	%append([1,2,3], X, [1,2,3,4,5,6]).
	%append(X, [3,4,5], [1,2,3,4,5]).
	%append(X, Y, [1,2,3]).
	bubble([3,4,5,6,7], X).
	
	
	
	
	
	

	
