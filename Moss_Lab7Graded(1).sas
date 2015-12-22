** Name: Brannden Moss;
** Assignment: Lab 7;
** Due Date: October 19,2015;


* GRADE: 28/30;

* #1) I like that cereal. Except when there's sugar... ; 

libname sasdata "C:\Users\cfeeley\Desktop\Lab Info";

proc sgplot data= sasdata.cereals; 
	vbar shelf;
	*vbar constructs a boxplot;
run;

proc sgplot data= sasdata.cereals; 
	vbar trans;
run;

proc sgplot data= sasdata.cereals; 
	vbox Calories;
run;

proc sgplot data= sasdata.cereals; 
	vbox TotalFat;
run;

proc sgplot data= sasdata.cereals; 
	vbox Sugar;
run;


/* Missing Calorie boxplot by shelf, -1*/
proc sgplot data= sasdata.cereals; 
	vbox TotalFat/Group=shelf;
	*this creates a box plot that is split up by shelf location;
run;

proc sgplot data= sasdata.cereals; 
	vbox Sugar/Group=shelf;
run;

proc sgplot data = sasdata.cereals; 
	histogram Sugar / transparency = .3;
	histogram TotalFat / transparency = .5;
	*this creates two histograms that have different 
	trancparency levels;
run;
 
/* plotting sugar as the plots not calories, -1*/
%macro mac1(cals=);
	
	proc sgplot data=sasdata.cereals;
		WHERE Calories < &cals;
		histogram Calories; 
		*FIRST HISTOGRAM WITH CALORIES;
	run;
	proc sgplot data=sasdata.cereals; 
		WHERE Calories < &cals;
		vbox Calories;
		*boxplot for the calories; 
	run;
%mend mac1;

%mac1(cals = 1000);




* #2) Theres some Lefties, time to analyze them! ; 

proc sgplot data = sasdata.lefties;
	vbox Age; 
	*This will work as a boxplot for age;
run;

proc sgplot data= sasdata.lefties; 
	vbox Age /Group=gender; 
	*This will set up side by side boxplots with respect to gender;
run;

proc sgplot data=sasdata.lefties; 
	vbar hand ;
run;

proc sgplot data=sasdata.lefties; 
	vbar  scissors ;
run;

proc sgplot data=sasdata.lefties; 
	vbar mouse ;
run;

proc sgplot data=sasdata.lefties; 
	vbar foot;
run;

proc sgplot data=sasdata.lefties; 
	vbar hand/ Group= scissors ;
	*this will stack the barcharts by the scissor handedness;
run;


*#3) Time to pattent down this information;


proc sgplot data=sasdata.patents;
	vbox patents;
run;

proc sgplot data=sasdata.patents;
	vbox patents/ Group=State;
	*While totally unintelligible as a graph, this will have all 
	50 states as boxplots. JEEZ; 
run;

proc sgplot data = sasdata.patents; 
	scatter x= population y=patents;
	*The variation in patents is explained by the population;
	*ghaaa, theres soooo much of a fan on this graph;
run;


proc sgplot data = sasdata.patents; 
	where State contains "C";
	scatter x= population y=patents;
	
	*The variation in patents is explained by the population;
	*ghaaa, theres soooo much of a fan on this graph;
	*California Colorado Connecticut, hmm, high population, wonder why;
run;

*Just gonna check to make sure I coded that properly...; 

/*proc print data=sasdata.patents; 
	where State contains "C";
run; */

%macro mac2(c_age=,c_pop=,mystate=);
	proc sgplot data = sasdata.patents; 
		histogram patents/ group = State;
		WHERE Age < &c_age and Population < &c_pop 
		and State = &mystate;
	run; 
%mend mac2;

%mac2(c_age=1000,c_pop=10000000,mystate='CALIFORNIA');
	









