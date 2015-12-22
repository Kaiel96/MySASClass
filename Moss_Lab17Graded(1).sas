

* GRADE: 14/16;


* #42);
libname ss "C:\Users\cfeeley\Desktop\Lab Info";

proc contents data = ss.conference;run;

proc format;
	value VegToChr
		1 = "Yes"
		0 = "No";
run;


data conference;
	set ss.conference;
	format VegMeal VegToChr.;
	count = 1;
run;

proc tabulate data=conference;
class RegType; 
var count; 
table RegType count;
run;  


proc tabulate data = conference  format = dollar12.2;
	class AreaCode RegType;
	var Rate;
	table AreaCode All,sum*Rate*(RegType All);
run;

/* needed totals, -1*/
proc tabulate data = conference;
	class AreaCode RegType;
	table AreaCode,(n PCTN)* RegType;
run;

proc freq data=conference;
	tables count*AreaCode*RegType;
run;

*43); 

proc contents data = ss.elliptical; run; 
data ell; 
set ss.elliptical; 
	if state in("California", "Oregon", "Washington") then region = "West Coast"; 
	else region = "Not West Coast";
	if prxmatch('/HRT/',machine) ~= 0 then ind = 1; 
	else ind = 0;
	if machine = "X6000HRT" then X6000HRT = 1;
	else if machine = "X6200HRT" then X6200HRT = 1;
	else X6600HRT = 1; 
run; 
	


proc tabulate data = ss.elliptical; 
	where State ~= "California";
	class State;
	var shipping;
	table State All, Mean*shipping;
	title "Average Shipping Cost";
run;

proc report data = ell; 
	column State Machine cost shipping tax total; 
	define State /GROUP; 
	define Machine / Order; 
	compute total; 
		total = cost.sum + shipping.sum + tax.sum;
	endcomp;
	title "subtotals";
run; 
	
/*supposed to be by division, -2*/
proc report data = ell; 
	where ind = 1;
	column Region State Machine cost shipping tax total ind X6000HRT X6200HRT X6600HRT; 
	define Region /GROUP;
	define State / Group;
	define Machine / Order; 
	compute total; 
		total = cost.sum + shipping.sum + tax.sum;
	endcomp;
	break after region / Summarize;
	title "totals";
run;
*Not West C 	  		grand total: $424,258.68 	X6000HRT: 134 	X6200HRT: 99 	X6600HRT: 59;
*West Coast 	  	  	grand total: $336,860.99 	X6000HRT: 221 	X6200HRT: 81 	X6600HRT: 59;
	

	*/
	

