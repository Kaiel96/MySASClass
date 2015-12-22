** Name: Brannden Moss;
** Assignment: Lab 15;
** Due Date: November 30,2015;

* GRADE: 40/48;

libname ss "C:\Users\cfeeley\Desktop\Lab Info";

**#29); 


data australia; 
	set ss.australia;
	rank = _N_;
	country = "australia";
	format country $20.;
run; 

data brazil; 
	set ss.brazil;
	rank = _N_;
	country = "brazil";
	Girl = Menina;
	Boy = Menino;
	drop Menina Menino;
run; 

data france; 
	set ss.france;
	rank = _N_;
	country = "france";
	Girl = Fille;
	Boy = Garcon;
	drop Fille Garcon;
run; 

data india; 
	set ss.india;
	rank = _N_;
	country = "india";
	Girl = Laraki;
	Boy = Laraka;
	drop Laraki Laraka;
run; 

data russia; 
	set ss.russia;
	rank = _N_;
	country = "russia";
	Girl = Devushka;
	Boy = Malchik;
	drop Devushka Malchik;
run; 
data US; 
	set ss.unitedstates;
	rank = _N_;
	country = "US";
run; 
data full; 
	set brazil france india russia US australia;
run;
proc sort data = full out = sorted; 
	by rank; 
run;
proc print data=sorted;
run;
/* missing interleaving & part e, -4*/

**#30);

data teachers; 
	set ss.teachers;
run; 
proc sort data=teachers out=Teachers;
	by TeacherScore CurriculumGrd;
run; 

data curriculum; 
	set ss.district;
	TeacherScore = TS;
	CurriculumGrd = CG;
	drop CG TS;
run;
proc sort data= curriculum out=Curriculum;
	by TeacherScore CurriculumGrd;
run; 
/* missing sorting by teacher, -2*/
data combine; 
	merge Teachers Curriculum;
	by TeacherScore CurriculumGrd;
	if Teacher = "" then delete;
run;
proc print data=combine;
run;
/* missing part d, -2 */
**#33);

proc sort data = ss.users out= users; 
	by UserID;
run;

proc sort data = ss.projects out= projects; 
	by UserID;
run;

data ITS noEnd Ended noProject; 
	merge users projects;
	by UserID;
	if EndDate = . and StartDate ~= . then output noEnd; 
	else if  EndDate ~= . and StartDate ~= . then output Ended;
	else output noProject;
run; 
proc contents data=ITS; run;
proc print data=noProject;run; 
**proc print data= ITS;** run;

**rosebowl stuff;


data Rosebowl;
	infile "/folders/myfolders/RawData/rosebowl.dat";
	input gameday ANYDTDTE10. @12 winningTeam : & $24. winningScore losingTeam : & $24. losingScore;
run; 

proc sort data = Rosebowl out = RoseSort; 
	by winningTeam;
run; 

data RoseBowl;
	set RoseSort;
	by winningTeam;
	scoreDif = winningScore-losingScore;
	if last.winningTeam then output;
	
	if gameday ~= "" then do;
		gameCounter+1;
		retain gameCounter;
	end;

	if winningTeam ~= tempTeam then do; 
		tempTeam = winningTeam;
		LetTheReignBEGINNNN = 0;
	end;
	LetTheReignBEGINNNN+1;
	retain tempTeam;
	format gameday weekdate29.;
	drop tempTeam  	 	winningScore 	 	losingScore;
	
run;
proc print data=RoseBowl;run; 

PROC IMPORT OUT= stat323 DATAFILE= "/folders/myfolders/RawData/StatMajors.xls" 
            DBMS=xls REPLACE;
     SHEET="323"; 
     GETNAMES=YES;
RUN;

PROC IMPORT OUT= stat330 DATAFILE= "/folders/myfolders/RawData/StatMajors.xls" 
            DBMS=xls REPLACE;
     SHEET="330"; 
     GETNAMES=YES;
RUN;

PROC IMPORT OUT= stat416 DATAFILE= "/folders/myfolders/RawData/StatMajors.xls" 
            DBMS=xls REPLACE;
     SHEET="416"; 
     GETNAMES=YES;
RUN;

PROC IMPORT OUT= stat418 DATAFILE= "/folders/myfolders/RawData/StatMajors.xls" 
            DBMS=xls REPLACE;
     SHEET="418"; 
     GETNAMES=YES;
RUN;

PROC IMPORT OUT= stat426 DATAFILE= "/folders/myfolders/RawData/StatMajors.xls" 
            DBMS=xls REPLACE;
     SHEET="426"; 
     GETNAMES=YES;
RUN;


PROC IMPORT OUT= Majors DATAFILE= "/folders/myfolders/RawData/StatMajors.xls" 
            DBMS=xls REPLACE;
     SHEET="Majors"; 
     GETNAMES=YES;
     
RUN;

data combineData; 
	merge 
	stat323 (rename = (Grade_in_Course= grade1))
	stat330 (rename = (Grade_in_Course= grade2))
	stat416 (rename = (Grade_in_Course= grade3))
	stat418 (rename = (Grade_in_Course= grade4))
	stat426 (rename = (Grade_in_Course= grade5))
	Majors (IN = Maj);
	by student_ID;
	if Maj then statInd = "Stat Major"; 
	else statInd = "Non-Stat Major";
	drop C;
run;

data gpa; 
	set combineData;
	units = 0;
	
	if prxmatch('/A/', grade1) ~= 0 then do;
		grade1 = 4; 
		units = units + 4;
	end;
	else if prxmatch('/B/', grade1) ~= 0 then do;
		grade1 = 3; 
		units = units + 4;
	end;
	else if prxmatch('/C/', grade1) ~= 0 then do;
		grade1 = 2; 
		units = units + 4;
	end; 
	else if prxmatch('/D/', grade1) ~= 0 then do;
		grade1 = 1; 
		units = units + 4;
	end;
	
	else if prxmatch('/F/', grade1) ~= 0 then do;
		grade1 = 0; 
		units = units + 4;
	end;
	else grade1 = 0;
	
	if prxmatch('/A/', grade2) ~= 0 then do;
		grade2 = 4; 
		units = units + 4;
	end;
	else if prxmatch('/B/', grade2) ~= 0 then do;
		grade2 = 3; 
		units = units + 4;
	end;
	else if prxmatch('/C/', grade2) ~= 0 then do;
		grade2 = 2; 
		units = units + 4;
	end; 
	else if prxmatch('/D/', grade2) ~= 0 then do;
		grade2 = 1; 
		units = units + 4;
	end;
	
	else if prxmatch('/F/', grade2) ~= 0 then do;
		grade2 = 0; 
		units = units + 4;
	end;
	else grade2 = 0;
	
	if prxmatch('/A/', grade3) ~= 0 then do;
		grade3 = 4; 
		units = units + 4;
	end;
	else if prxmatch('/B/', grade3) ~= 0 then do;
		grade3 = 3; 
		units = units + 4;
	end;
	else if prxmatch('/C/', grade3) ~= 0 then do;
		grade3 = 2; 
		units = units + 4;
	end; 
	else if prxmatch('/D/', grade3) ~= 0 then do;
		grade3 = 1; 
		units = units + 4;
	end;
	
	else if prxmatch('/F/', grade3) ~= 0 then do;
		grade3 = 0; 
		units = units + 4;
	end;
	else grade3 = 0;
	
	if prxmatch('/A/', grade4) ~= 0 then do;
		grade4 = 4; 
		units = units + 4;
	end;
	else if prxmatch('/B/', grade4) ~= 0 then do;
		grade4 = 3; 
		units = units + 4;
	end;
	else if prxmatch('/C/', grade4) ~= 0 then do;
		grade4 = 2; 
		units = units + 4;
	end; 
	else if prxmatch('/D/', grade4) ~= 0 then do;
		grade4 = 1; 
		units = units + 4;
	end;
	
	else if prxmatch('/F/', grade4) ~= 0 then do;
		grade4 = 0; 
		units = units + 4;
	end;
	else grade4 = 0;
	
	if prxmatch('/A/', grade5) ~= 0 then do;
		grade5 = 4; 
		units = units + 4;
	end;
	else if prxmatch('/B/', grade5) ~= 0 then do;
		grade5 = 3; 
		units = units + 4;
	end;
	else if prxmatch('/C/', grade5) ~= 0 then do;
		grade5 = 2; 
		units = units + 4;
	end; 
	else if prxmatch('/D/', grade5) ~= 0 then do;
		grade5 = 1; 
		units = units + 4;
	end;
	
	else if prxmatch('/F/', grade5) ~= 0 then do;
		grade5 = 0; 
		units = units + 4;
	end;
	
	else grade5 = 0;
	drop B;
	GPA =(grade1+grade2+grade3+grade4+grade5)*4/(Units);
run; 

proc means data = gpa mean;
	class StatInd;
run;

proc print data=gpa;
run;




*SORRY CAITI, SO MANY IF STATEMENTS;


*I OWE YOU A COOKIE.;






