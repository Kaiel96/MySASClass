/*
Name: Brannden Moss, Sebastian Rowell
Assignment: Lab2
Due date: Wed September 30 2015
*/


/*X was supposed to be initialized to 4 to check, -1*/
data factorial;
	x = 4;
	fact = 1;
	do while (x>1);
		fact = fact * (x*(x-1));
		x = x - 2;
	end;
run;

proc print data = factorial;
title "factorial";
run;

data euler02;
	x1 = 1;
	x2 = 2;
	x3 = 3;
	var = 0;
	even = 2;

	do while (var < 4000000); 
		var = x3 + x2;
		x1 = x2;
		x2 = x3;
		x3 = var;
		if mod(var,2) = 0 then even = even + var;
		end;
run; 

proc print data = euler02;
title "Euler 02";
run;


/*Number of observations will suffice for this lab, but in the future
create a count or flag variable to keep track of how many times
you are iterating through the loop in order to answer this type of
question. */
data euler19;
	start = '1jan1901'd;
	end = '31dec2000'd;
	
	do i = start to end;
		if weekday(i) = 1 and day(i) = 1 then do; 
			month = month(i);
			year = year(i);
			output;
		end;
	end; 
		
	
run; 

proc print data = euler19;
title "Euler 19";
run;



