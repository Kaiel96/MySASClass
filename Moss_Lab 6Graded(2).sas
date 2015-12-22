** Name: Brannden Moss;
** Assignment: Lab 6;
** Due Date: October 14,2015;


* GRADE: 16/28;

libname sasdata "C:\Users\cfeeley\Desktop\SAS Data Sets";

* #1);
proc format; 
	value Cal
		low-100 = "Low Calorie"
		100-high = "Not low Calorie";
run;
/* Shelf not name, -2*/
proc freq data= sasdata.cereals;
	tables Name;
	title "Names of different cereals in the data set";
run;


proc freq data = sasdata.cereals;
	tables Trans; 
	title "# of cerals with trans fat";
	run;

proc print data=sasdata.cereals; 
	*this is to check and see if my format followed right; 
	title "Calorie Formated";
	var Calories;
	format Calories Cal.;
run;
	
proc means data = sasdata.cereals mean stddev;
	var Calories TotalFat Sugar;
	format Calories Cal.;
	title "Means and Standard Dev of Cal Total Fat and Sugar";
run;


proc means data = sasdata.cereals mean stddev;
	Class Shelf;
	var Calories TotalFat Sugar;
	title "Mean and Standard Dev of each shelves Calories 
	total Fat and Sugar";
	format Calories Cal.;
run;

* #2);

proc format; 
	value $handy
		"Right" = "Righty"
		"Left" = "SouthPaw";
run;
/* Need overall proc means for var, without class statement, -2*/
proc means data= sasdata.lefties mean;
	Class Gender;
	var Age;
	title "Gender and Age for handedness";
	format Hand Foot Scissors Mouse Foot $handy.;
run;

proc freq data=sasdata.lefties; 
	tables Hand Foot Scissors Mouse Foot;
	format Hand Foot Scissors Mouse Foot $handy.;
	
run;

proc freq data=sasdata.lefties; 
	tables Hand*Scissors; 
	format Hand Scissors $handy.;
	
run;

/*Tables Hands*Scissors*Mouse, -2 */
proc freq data=sasdata.lefties; 
	tables Hand*Scissors Scissors*Mouse; 
	format Hand Scissors Mouse $handy.;
	
run;
* #3);

proc means data = sasdata.patents max; 
	title "Max Patents for a County";
	var patents;
run;

proc means data = sasdata.patents sum; 
	var Population;
	title "Sum of Population";
run;
	

/* Missing proc means (var population class state) 
   Missing proc format
   Missing highest population in California, -6*/


	



