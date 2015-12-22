** Name: Brannden Moss;
** Assignment: Lab 5;
** Due Date: October 12,2015;

* GRADE: 15/16;


libname sasdata "C:\Users\cfeeley\Desktop\SAS Data Sets";

data newYearsReturners;
	set sasdata.NewYears;
	array inday(119);
	array outday(119);
	array minDay(119);
	array minWeek(17);
	*this is me creating my arrays; 
	
	i = 1;
	avgHour = 0;
	do while (i < 120);
		minDay(i) = minute(outday(i)-inday(i));
		*minute function turns this difference into a minute; 
		avgHour = avgHour + inday(i);
		i = i + 1;	
	end;
			timeIn = avgHour/119;
			if 5 < hour(timeIn) <= 10  then timeGroup = "Early Birds";
			else if  10 < hour(timeIn) < 17  then timeGroup = "Afternooners";
			else if  17 < hour(timeIn) < 22 then timeGroup = "Late Nighters";
	
	
	i = 1;
	j = 1;
	do while (i < 120);
		if mod(i,7) = 0 then do;
			minWeek(j) = minDay(i) + minDay(i-1) + minDay(i-2) +
			minDay(i-3) + minDay(i-4) + minDay(i-5) + minDay(i-6);
			/* Calculation is a little off, -1*/
			if minWeek(j)/7 >= 30 then flag = "elligible";
			else flag = "inelligible";
			j = j + 1; 
		end;
		i = i + 1;
	end;
	
	
	drop inday1-inday119 outday1-outday119 i j;
	
run;
/* nice title */
proc print data = Newyearsreturners;
title "LOOK AT ALL THIS DATA!																		DAAAAANGGGG";
run;
