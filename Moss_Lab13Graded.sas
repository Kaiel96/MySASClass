

* GRADE: 26/34;

*#32);
*prxmatch 32d;
*substring 32c;
data confrence; 
	infile "C:\Users\cfeeley\Desktop\Lab Info/Conference.dat" missover;
	input fname : $15. lname : $15. ID $ b_phone $ 47-60 h_phone $ 61-74
		 cellPhone $ 75-88  contactBuis $ contactHome $ contactCell $ 
		 regRate mixerAttendence $ lunchAttend $  volunteer $  diet $14.;
	if regRate = 350 or regRate = 200 or regRate = 450 then group = "Regular"; 
	else if regRate = 295 or regRate = 150 or regRate = 395 then group = "Early"; 
	else group = "On-Site";
/* start position of substr at 2 so it just gets numbers and can be numeric */
	if length(b_phone) < 13 then area = substr(cellPhone,1,5);
	else if length(cellPhone) < 13 then area = substr(h_phone,1,5);
	else area = substr(b_phone,1,5);

	diet = upcase(diet);
	if prxmatch('/VEG/', diet) ~= 0  then flag = 1;
	else flag = 0;
	/* it's working for me!*/

	*Code isn't running so going to make hypothetical;

	/* incorrect below, -2*/
	*Tina Gonzales: 1082. Group: Regular Meal: 1 (vegan/veggi) Area Code:(909) ;
	*Patrick Anderson: 1083. Group: Early Meal: 0 (nonveggi)  Area Code:(805) ;
run; 

proc print data = confrence; 
run; 

data iceCream;
	infile "C:\Users\cfeeley\Desktop\Lab Info/BenAndJerrys.dat" DSD DLM = ',';
	input name : $35. size cal calFat fat satFAt transFat chol sodium carbs sugar fiber protien introYear $ exitYear $ @;
		if exitYear ~= ""  then do;
			input /; 
			delete; 
		end; 
	input descrip : $100. notes : $150.;
		if notes = "Scoop Shop Exclusive" then do;
			input /; 
			delete;
		end; 
			
	calPerTbs = cal/size*15;
	*calculate the total calories for 1TB of each flavor;
	*find out which one has the most calories. Result should appear in the row of last obs;
	calTotal = 0;
	current = 0;
	named = "";
	if calPerTbs ~= . then do;
		calTotal+calPerTbs;
		if calPerTbs > current then do; 
			named = name; 
			retain named;
			current = calPerTbs;
		end;
	end;
	
	/* incorrect, remove the = calTotal, -2*/
	
	calTotal = calTotal + calPerTbs;
	*state total cals consumed and the highest number of calories;
	*Code isn't running so going to make hypothetical;

	/* incorrect, -2*/
	*Total cals: 10,000;
	*highestNumber: Banana Split;
	 
	
run; 
proc print data = iceCream; 
run; 

data WW; 
	infile "/folders/myfolders/SAS book data/Chapter3_data/WLSurveys.dat" DSD DLM = '09'x;
	input ID $ height wt1-wt5 q1-q30;
	array questions (30) q1-q30;
	array wts (5) w1-w5;
	array bmi (5) bmi1-bmi5;
	i = 1;
	do i=1 to 30;
		if questions(i) = -99 then questions(i) = . ;
		else if i%6 = 2 and questions(i) = 0 then questions(i) = 3;
		else if i%6 = 2 and questions(i) = 1 then questions(i) = 2;
		else if i%6 = 2 and questions(i) = 2 then questions(i) = 1;
		else if i%6 = 2 and questions(i) = 3 then questions(i) = 0;
		else if i%6 = 3 and questions(i) = 0 then questions(i) = 3;
		else if i%6 = 3 and questions(i) = 1 then questions(i) = 2;
		else if i%6 = 3 and questions(i) = 2 then questions(i) = 1;
		else if i%6 = 3 and questions(i) = 3 then questions(i) = 0;
		else if i%6 = 5 and questions(i) = 0 then questions(i) = 3;
		else if i%6 = 5 and questions(i) = 1 then questions(i) = 2;
		else if i%6 = 5 and questions(i) = 2 then questions(i) = 1;
		else if i%6 = 5 and questions(i) = 3 then questions(i) = 0;
	end;
	
	do i = 1 to 5; 
		bmi(i) = ((wts(i)/height)**2)*703;
	end; 
	
	do i = 1 to 5; 
		if bmi(i) < 25 then do;
		/* don't need this input statment*/
			input /;
			delete; 
	end;

	/* incorrect, -2*/
	*find 10th observation. State subject ID, number of questions with missing values, and last BMI;
	*Code isn't running so going to make hypothetical;
	*subject ID: 15, number of questions with missing values: 0, and last BMI: 26.5;
run;
proc print data = WW; 
run;
