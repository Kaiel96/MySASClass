** Name: Brannden Moss;
** Assignment: Lab 1;
** Due Date: September 23,2015;


/***************/
/* GRADE: 18/20
/***************/


/*Incorrect savings calculation -1*/
data joe;
	*We are going to start by figuring out the sas
	day for the birthday;
	sasbday = mdy(3,15,2013);
	
	*then, we are going to calculate the days it takes 
	to turn sixteen and 18;
	
	sixteen = 365.25*16;
	eighteen = 365.25*18;
	
	*Now we are going to find out the sas day of the 16th 
	and eighteenth birthday;
	
	sas16 = sixteen + sasbday;
	sasadult = eighteen + sasbday;
	
	*Now we are going to find the days from today until that day
	and convert it into years;
	
	days16 = sas16 - today();
	yr16 = days16/365.25;
	days18 = sasadult - today();
	yradult = days18/365.25;

	* Now we begin the investments;
	
		*We are going to begin by initializing the years and car 
		payment;
		
		year = yr16;
		car = 0;
		
		*each year we increment through and add to the investment;
		do until ( year < 1);
			*each year they are contributing an extra $600;
			investment_car = 600*(1+(.02/1))**year;
			car = car + investment_car;
			year = year - 1;
		end;

	if car >= 10000 then car_news = "Good News";
	else car_news = "Bad News";

		year_ = yradult;
		college = 0;
		
		do until ( year_ < 1);
			invest_college = 12000*(1+(.02/1))**year;
			college = college + invest_college;
			year_ = year_ - 1;
		end;
	

	if college >= 400000 then uni_news = "Good News";
	else uni_news = "Bad News";
	*realistically 400,000 isn't going to be the cost of the tuition;

run;

proc print data = joe; 
title "Joe";
run;


data mitch;
	*We are going to start by figuring out the sas
	day for the birthday;
	sasbday = mdy(1,15,2010);
	
	*then, we are going to calculate the days it takes 
	to turn sixteen and 18;
	
	sixteen = 365.25*16;
	eighteen = 365.25*18;
	
	*Now we are going to find out the sas day of the 16th 
	and eighteenth birthday;
	
	sas16 = sixteen + sasbday;
	sasadult = eighteen + sasbday;
	
	*Now we are going to find the days from today until that day
	and convert it into years;
	
	days16 = sas16 - today();
	yr16 = days16/365.25;
	days18 = sasadult - today();
	yradult = days18/365.25;

	* Now we begin the investments;
	
		*We are going to begin by initializing the years and car 
		payment;
		
		year = yr16;
		car = 0;
		
		*each year we increment through and add to the investment;
		do until ( year < 1);
			year = year - 1;
			investment_car = 600*(1+(.02/1))**year;
			car = car + investment_car;
		end;

	if car >= 10000 then car_news = "Good News";
	else car_news = "Bad News";

		year_ = yradult;
		college = 0;
		
		do until ( year_ < 1);
			year_ = year_ - 1;
			invest_college = 12000*(1+(.02/1))**year;
			college = college + invest_college;
		end;
	

	if college >= 400000 then uni_news = "Good News";
	else uni_news = "Bad News";

run;

proc print data = mitch; 
title "Mitch";
run;

data scott;
	*We are going to start by figuring out the sas
	day for the birthday;
	sasbday = mdy(11,25,2006);
	
	*then, we are going to calculate the days it takes 
	to turn sixteen and 18;
	
	sixteen = 365.25*16;
	eighteen = 365.25*18;
	
	*Now we are going to find out the sas day of the 16th 
	and eighteenth birthday;
	
	sas16 = sixteen + sasbday;
	sasadult = eighteen + sasbday;
	
	*Now we are going to find the days from today until that day
	and convert it into years;
	
	days16 = sas16 - today();
	yr16 = days16/365.25;
	days18 = sasadult - today();
	yradult = days18/365.25;

	* Now we begin the investments;
	
		*We are going to begin by initializing the years and car 
		payment;
		
		year = yr16;
		car = 0;
		
		*each year we increment through and add to the investment;
		do until ( year < 1);
			year = year - 1;
			investment_car = 600*(1+(.02/1))**year;
			car = car + investment_car;
		end;

	if car >= 10000 then car_news = "Good News";
	else car_news = "Bad News";

		year_ = yradult;
		college = 0;
		
		do until ( year_ < 1);
			year_ = year_ - 1;
			invest_college = 12000*(1+(.02/1))**year;
			college = college + invest_college;
		end;
	

	if college >= 400000 then uni_news = "Good News";
	else uni_news = "Bad News";

run;

proc print data = scott; 
title "Scott";
run;
/*NOTES: Great commenting!*/
