** Name: Brannden Moss;
** Assignment: Lab 10;
** Due Date: November 2,2015;

* GRADE: 20/22;


*#1);

data earthquake;
infile "C:\Users\cfeeley\Desktop\Lab Info/Earthquake.dat";
input map $ magn @12 datetime YMDDTTM. lat long depth location $40.;
if lat > 0 then hemisphere = "North";
else hemisphere = "South";
run; 

proc print data=earthquake;
format datetime Datetime.; 
run;

proc SGPLOT data=earthquake;
	series x= datetime y = magn;
run;

proc means data = earthquake n; 
	where location contains "MEXICO";
	TITLE "Mexico freq";
run; 
*17 earthquakes occured in Mexico;

proc means data = earthquake n; 
	where location contains "ALASKA";
	TITLE "Alaska freq";
run;
*34 earthquakes occured in alaska;
proc freq data = earthquake; 
	tables location;
run;
* the most earthquakes occured in Baja CA, Mexico;

proc means data = earthquake n; 
/* includes 5, -1*/
	where magn > 5;
	title "Magn 5 or higher";
run;
*there were 27 earthquakes of magnitude 5 or higher;

data bigComp; 
infile "C:\Users\cfeeley\Desktop\Lab Info/BigCompanies.dat";
input rank name $30. Country $16. @53 Sales DOLLAR6.1 @63 Profits DOLLAR5.1 @70 Assets DOLLAR8.1 @82 MarketVal DOLLAR6.1; 
run;

proc print data = bigComp;
title "Big Company data"; 
run;

proc means data=bigComp mean;
	var rank;
	title "Mean rank of a company"; 
	/* where country = "united states", -1*/
run;

proc corr data=bigComp;
	var Sales Profits Assets MarketVal;
	title "Correlations between market Value and other predictors."
run;
quit;

proc sgplot data=bigComp;
	scatter x= Profits y=MarketVal/ datalabel=rank;
	title "Scatter of Profits by marketval";
run;

proc sgplot data=bigComp;
	where rank <= 50;
	scatter x= Profits y=MarketVal/ datalabel=Country;
	title "Scatter of Profits by marketval for rank > 50";
	
run;

	 

	
	 
	
