** Name: Brannden Moss;
** Assignment: Lab 14;
** Due Date: November 18,2015;



* GRADE: 30/36;

libname ss "C:\Users\cfeeley\Desktop\Lab Info";

proc contents data = ss.crayons; 
run; 
*color Char 26;
*two different ways that the variables can be viewed: proc contents or open the table and view normally; 


proc sort data = ss.crayons out = crayons2; 
	by Issued;
run;

data NewCrayons;
	set crayons2;
	by Issued;
	if Issued ~= year then do;
		year = Issued;
		total = 1;
	end;
	else total+1;
	retain year;
	if last.Issued then output;
run; 
*1949 with 40 issued!;
proc print data = NewCrayons;
run;
/* incorrect (look at bottom of data), -2*/
proc sort data = ss.crayons out = RGB; 
	by RGB;
run;
proc print data = RGB;
	var color RGB; 
run;


proc contents data = ss.sff; 
run; 
*Continent 	Char 	13
Country 	Char 	30 	Name of country;
proc sort data = ss.sff out = contin; 
	by Continent; 
run;

data countries;
	set contin;
	if name ~= Continent then do; 
		CountryCount = 1;
		name = Continent;
	end;
	else CountryCount+1; 
	retain name;
run; 
proc print data= countries; 
run; 

data countriesDiseasedApr;
	set contin;
	if name ~= Continent and Apr = . then do; 
		HealthyCount = 1;
		DiseaseCount = 0; 
		name = Continent;
		
	end;
	else if Apr ~= . then DiseaseCount+1;  
	else do; 
		HealthyCount+1;
		
	end; 
	retain name;
run;
proc print data=countriesDiseasedApr;
var healthyCount diseasecount name; 
run;  
/* incorrect execution for this portion, -2*/
data countriesDiseasedAug;
	set contin;
	if name ~= Continent and Aug = . then do; 
		HealthyCount = 1;
		DiseaseCount = 0; 
		name = Continent;
		
	end;
	else if Aug ~= . then DiseaseCount+1;  
	else do; 
		HealthyCount+1;
		
	end; 
	retain name;
run;
proc print data=countriesDiseasedAug; 
run;  


data fault; 
	set contin; 
	if FirstCase = . and FirstDeath ~= . then output;
run; 
proc print data = fault;
	var continent country FirstCase Latest FirstDeath ;
	format FirstDeath MMDDYY.;
run; 

data Rosebowl;
	infile "C:\Users\cfeeley\Desktop\Lab Info/rosebowl.dat";
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

proc print data = RoseBowl; 
run;

/* missing part f, -2*/
