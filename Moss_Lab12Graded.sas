** Name: Brannden Moss;
** Assignment: Lab 12;
** Due Date: November 9,2015;

* GRADE: 22/22;
* nice work!;


data mountain; 
	infile "C:\Users\cfeeley\Desktop\Lab Info\Mountains.dat";
	*name should be a character, height a numeric for both, year
	as a character due to some being unclimbed, and prominence as a numeric;
	input name & $36. @39 heightMetric Comma7. heightImp Comma9. @56 ascentYr : $9. prominence : Comma7.;
run;
proc print data= mountain; 
run;

data its1; 
	infile "C:\Users\cfeeley\Desktop\Lab Info\CompUsers.dat"; 
	input id Position $ FName :$10. LName : $15. /
	@"email:" email_address : $25. @"phone:" phone : $8. dept : $4.;
run; 
proc print data=its1; 
run;
data its2; 
	infile "C:\Users\cfeeley\Desktop\Lab Info\CompUsers.dat"; 
	input id Position $ @; 
	if Position = "Student" then do;
		input /;
		delete; 
	end; 
	input FName :$10. LName : $15. /
	@"email:" email_address : $25. @"phone:" phone : $8. dept : $4.;
run; 
proc print data=its2; 
run;

data tchol; 
	infile "C:\Users\cfeeley\Desktop\Lab Info\Tchol.dat";
	input subjId Group : $9. diffChol $ preChol postChol @@;
run; 
proc print data=tchol; 
run;
	
data tchol2; 
	infile "C:\Users\cfeeley\Desktop\Lab Info\Tchol.dat";
	input subjId Group : $9. @@;
	if Group = "Control" then do; 
		input +10 @@;
		delete;
	end; 
	input diffChol $ preChol postChol @@;
run; 
proc print data=tchol2; 
run;

 
