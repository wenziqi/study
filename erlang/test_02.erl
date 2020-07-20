-module(test_02).
-export([append/2]).
-export([sum/1]).
-export([my_length/1]).
-export([my_length2/1]).
-on_load(init/0).


append([],A) ->
	[A];
append([H|T],A) ->
	[H|append(T,A)].


sum(N) ->
	sum(N,0).
sum(0,S) ->
	S;
sum(N,S) ->
	sum(N-1,N+S).


my_length([]) ->
	0;
my_length([_H|T]) ->
	1+length(T).

my_length2(T) ->
	my_length2(T,0).
my_length2([],Acc) ->
	Acc;
my_length2([_H|T],Acc) ->
	my_length2(T,Acc+1).


init() ->
	io:format("load test_02 ok~n",[]).

