/*
Name: Brannden Moss
Assignment: Lab4
Due date: Wed October 7, 2015
*/


* GRADE: 30/30;


* +2 pts for commenting, nice!;

data them_loans_a;
	
		
	
	input name $ school $ loan int_rte st_yr yrs_spent sal payment;
	
	month = 1;
	year = 1;
	*Since we are in the first year and month of payment, and we are assuming
	that we don't have unsubsidized;
	do while (loan > 0);
		loan = loan - payment;
		*each time, we are going to make a payment on our loan, then increment
		our month;
		month = month + 1;
		*we are going to set a mod so we can keep the months running; 
		
		if mod(month,12) = 0 then do;
			*yearly intrest rate;
			loan = loan + loan*(int_rte);
			year = year +1;
		end;
		drop school loan int_rte st_yr yrs_spent sal payment;
	end;
	
	*now we are going to find the month by multiplying by 12 then adjusting 
	(since we had our year begin at one); 
	
	end_month = month-(year*12)+ 12;
	
	*our year is based on our start year, years spent, and our incremented year;
	end_year = st_yr + yrs_spent + year;
	
		
	datalines;
	Caiti CMU 240000 .061 2013 5 95000 625
	Hank ParkU 45000 .059 2012 4 70000 450 
	Sarah BlueMtn 40000 .058 2014 4 85000 500
	Steve Vassar 234000 .06 2012 5 80000 600
	Chris Trinity 200000 .055 2010 4 90000 525
	Emily Amherst 160000 .058 2014 4 75000 550
	Jessica Berea 6000 .05 2013 5 65000 400 
	Mark Rust 38000 .0575 2011 4 60000 450
	;
	
	 
run; 

proc print data=them_loans_a; 
title "Part a";
run; 

data them_loans_b;
	
		
	
	input name $ school $ loan int_rte st_yr yrs_spent sal payment;
	*we do not need the year this time so we increment just month;
	month = 1;
	
	do while (loan > 0);
		
		loan = loan - payment;
		month = month + 1;
		if mod(month,12) = 0 then do; 
			loan = loan + loan*(int_rte);
			*the loan is increacing by the intrest rate; 
			payment = payment + payment*.03; 
			sal = sal + sal*.03;
		end;
		drop school loan int_rte st_yr yrs_spent sal payment; 
		
	end;
		
	datalines;
	Caiti CMU 240000 .061 2013 5 95000 625
	Hank ParkU 45000 .059 2012 4 70000 450 
	Sarah BlueMtn 40000 .058 2014 4 85000 500
	Steve Vassar 234000 .06 2012 5 80000 600
	Chris Trinity 200000 .055 2010 4 90000 525
	Emily Amherst 160000 .058 2014 4 75000 550
	Jessica Berea 6000 .05 2013 5 65000 400 
	Mark Rust 38000 .0575 2011 4 60000 450
	;
	
	 
run; 

proc print data=them_loans_b; 
title "Part b";
run; 

data them_loans_c1;
	
		
	
	input name $ school $ loan int_rte st_yr yrs_spent sal payment;
	
	month = 1;
	year = 1;
	savings = 0;
	*alright chitlins, now we have three, count em, THREE incrementers;
	
	do while (year < 40);
	*this gets us the first 40 years;
		loan = loan - payment;
		month = month + 1;
		*same as before;
		if mod(month,12) = 0 then do; 
			loan = loan + loan*(int_rte);
			payment = payment + payment*.03; 
			sal = sal + sal*.03;
			year = year + 1;
			savings = savings + sal*.1;
			*put away ten percent of our salary each year;
		end;
		drop school loan int_rte st_yr yrs_spent sal payment; 
		
	end;
		
	datalines;
	Caiti CMU 240000 .061 2013 5 95000 625
	Hank ParkU 45000 .059 2012 4 70000 450 
	Sarah BlueMtn 40000 .058 2014 4 85000 500
	Steve Vassar 234000 .06 2012 5 80000 600
	Chris Trinity 200000 .055 2010 4 90000 525
	Emily Amherst 160000 .058 2014 4 75000 550
	Jessica Berea 6000 .05 2013 5 65000 400 
	Mark Rust 38000 .0575 2011 4 60000 450
	;
	
	 
run; 

proc print data=them_loans_c1; 
title "Part c1";
run; 
data them_loans_c2;
	
	/* Caiti's savings are a little off, check solns: No point deduction*/	
	
	input name $ school $ loan int_rte st_yr yrs_spent sal payment;
	
	month = 1;
	year = 1;
	savings = 0;
	
	*alright, so we begin with getting that loan to zero;
	do while (loan > 0);
		loan = loan - payment;
		month = month + 1;
		if mod(month,12) = 0 then do; 
			loan = loan + loan*(int_rte);
			payment = payment + payment*.03; 
			sal = sal + sal*.03;
			year = year + 1;
			savings = savings + sal*.1;
		end; 
	end;
	
	*now we deal with the extra years for anyone who has finished paying the loans;
	do while (year < 40); 
		savings = savings + sal*.1 + payment;
		payment = payment + payment*.03; 
		sal = sal + sal*.03;
		year = year + 1;
	end;
	
	drop school loan int_rte st_yr yrs_spent sal payment;
		
	datalines;
	Caiti CMU 240000 .061 2013 5 95000 625
	Hank ParkU 45000 .059 2012 4 70000 450 
	Sarah BlueMtn 40000 .058 2014 4 85000 500
	Steve Vassar 234000 .06 2012 5 80000 600
	Chris Trinity 200000 .055 2010 4 90000 525
	Emily Amherst 160000 .058 2014 4 75000 550
	Jessica Berea 6000 .05 2013 5 65000 400 
	Mark Rust 38000 .0575 2011 4 60000 450
	;
	
	 
run; 

proc print data=them_loans_c2; 
title "Part c2";
run; 
