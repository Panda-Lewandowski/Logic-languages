predicates
	phone_number(symbol,symbol).
clauses
	phone_number(ellen, "8192883393").
	phone_number(bill, "8449494949"). 
	phone_number(tom, "8837373783"). 
	phone_number(tom, "8593952045").
	phone_number(sara, "833945593"). 
	phone_number(misha, Number) :- phone_number(bill, Number).
	phone_number(alisha, Number) :- phone_number(misha, Number).
goal
	%phone_number(alisha, Phone).
	phone_number(Name, "8449494949").