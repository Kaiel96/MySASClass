** Name: Brannden Moss;
** Assignment: Lab 16;
** Due Date: November 30,2015;

* GRADE: 6/8;


libname ss "C:\Users\cfeeley\Desktop\Lab Info";
proc contents data= ss.advising; run;
proc sort data= ss.advising; 
	by ApptDate ID; 
run; 
data _null_; 
	set ss.advising;
	file "C:\Users\cfeeley\Desktop\Lab Info/lab16.txt";
	if ApptDate = . then put "XX/XX/XXXX" @11 First 11 "." Last ID;
	else put ApptDate MMDDYY10. @11 First 11 "." Last ID;

	/* format first as $1. or other tactic to get that first letter, -2*/
	
run; 
