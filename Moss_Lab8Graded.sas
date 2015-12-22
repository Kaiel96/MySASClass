** Name: Brannden Moss;
** Assignment: Lab 7;
** Due Date: October 19,2015;


* GRADE: 30/30;

libname sasdata "C:\Users\cfeeley\Desktop\Lab Info";

%macro nutrition(nutvar=);
	ods graphics off;
	
	proc sgplot data=sasdata.cereals; 
		vbox &nutvar/ group= Shelf;
		*this will split it up into the different groups;
	run;
	
	proc means data = sasdata.cereals mean std;
		 class shelf; 
		 var &nutvar;
		 *this gets the mean and standard deviation for the shelves for select
		 nutritional variable;
	run;
	
	
	proc ttest data = sasdata.cereals sides=2 alpha=.01;
		where shelf = 1 or shelf = 2;
		class shelf;
		var &nutvar;
		
	run;
	
	
	
	proc ttest data = sasdata.cereals sides=2 alpha=.01;
		where shelf = 2 or shelf = 3;
		class shelf;
		var &nutvar;
		
	run;
	
	proc ttest data = sasdata.cereals sides=2 alpha=.01;
		where shelf = 1 or shelf = 3;
		class shelf;
		var &nutvar;
		
	run;
	*the mean from nutval, both sides, and alpha levels;
	
	/* Incorrect conclusions about calories, all combos are not 
	significnat. (no pt deduction) */
	
	/*
	Ho: The mean grams of Calories on shelf 1 is equal to shelf 2
	Ha: The mean grams of Calories on shelf 1 is not equal to shelf 2
	
	test statistic: F= 13.38; pvalue < .001;
	
	reject
	
	At an alpha level of .01, we found statistically significant evidence
	that the mean amount of Calories in each cereal is different between 
	shelf 1 and 2. 
	*/
	
	
	/*
	Ho: The mean grams of Calories on shelf 1 is equal to shelf 3
	Ha: The mean grams of Calories on shelf 1 is not equal to shelf 3
	
	test statistic: F = 39.79; pvalue <.0001;
	
	 reject
	
	At an alpha level of .01, we found statistically significant evidence
	that the mean amount of Calories is different between shelf 1 and 3. 
	*/
	
	/*
	Ho: The mean grams of Calories on shelf 2 is equal to shelf 3
	Ha: The mean grams of Calories on shelf 2 is not equal to shelf 3
	
	test statistic: F= 2.97; pvalue = 0.0319
	
	fail to reject
	
	At an alpha level of .01, we failed to find statistically significant evidence
	that the mean amount of Calories is different between shelf 2 and 3. 
	*/
	
	
	
	
	
	/*
	Ho: The mean grams of Sugar on shelf 1 is equal to shelf 2
	Ha: The mean grams of Sugar on shelf 1 is not equal to shelf 2
	
	test statistic: F = 8.38; pvalue <.001
	
	reject
	
	At an alpha level of .01, we found statistically significant evidence
	that the mean amount of Sugar is different between shelf 1 and 2. 
	*/
	
	
	/*
	Ho: The mean grams of Sugar on shelf 1 is equal to shelf 3
	Ha: The mean grams of Sugar on shelf 1 is not equal to shelf 3
	
	test statistic: F= 17.79; pvalue < .001;
	
	reject
	
	At an alpha level of .01, we found statistically significant evidence
	that the mean amount of Sugar is different between shelf 1 and 3. 
	*/
	
	/*
	Ho: The mean grams of Sugar on shelf 2 is equal to shelf 3
	Ha: The mean grams of Sugar on shelf 2 is not equal to shelf 3
	
	test statistic: F= 2.12; pvalue = .1337
	
	fail to reject
	
	At an alpha level of .01, we failed to find statistically significant evidence
	that the mean amount of Sugar is different between shelf 2 and 3. 
	*/
	
	
%mend; 

%nutrition(nutvar=Calories);
%nutrition(nutvar=Sugar); 



%macro nut2(nutvar=, mu0=, dir=, alpha=);
	proc sgplot data=sasdata.cereals;
		histogram &nutvar;
	run; 
	proc ttest data = sasdata.cereals Ho = &mu0 sides=&dir alpha= &alpha;
		var &nutvar;
	run;
%mend;
%nut2(nutvar=TotalFat, mu0=1, dir=U, alpha = .05);
/*
Ho: The mean grams of fat <= 1
Ha: The mean grams of fat is >1

test statistic: t= 1.77; pvalue =  0.0416

reject

At an alpha level of .05, we found statistically significant evidence
that the mean amount of grams of fat in the cereals is greater than 1 gram. 
*/

%macro pat1(mystate=, othervar=); 
	
	%if &mystate ~= "all" %then %do; 
		proc sgplot data = sasdata.patents;
			where state = &mystate;
			scatter y = patents x = &othervar;
			title "Specific state";
		run;
		
		proc corr data=sasdata.patents;
			where state = &mystate;
			var patents &othervar;
			title "Specific state";
		run;
	%end;
	
	%else %if &mystate = "all" %then %do; 
		proc sgplot data = sasdata.patents;
			scatter y = patents x = &othervar;
		title "All States";
		run;
		
		proc corr data=sasdata.patents;
			var patents &othervar;
			title "All States";
		run;
		
	%end;
	
	
%mend pat1;
%pat1(mystate="CALIFORNIA",othervar=Age);
%pat1(mystate="all", othervar=Age);
%pat1(mystate="CALIFORNIA",othervar=Population);
%pat1(mystate="all", othervar=Population);
%pat1(mystate="CALIFORNIA",othervar=Education);
%pat1(mystate="all", othervar=Education);
%pat1(mystate="CALIFORNIA",othervar=Housing);
%pat1(mystate="all", othervar=Housing);
%pat1(mystate="CALIFORNIA",othervar=Income);
%pat1(mystate="all", othervar=Income);

/* For only California, Income seemed to be the most associated with patents
For all states, Population seemed to be the most associated with patents */
