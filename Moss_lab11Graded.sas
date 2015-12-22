** Name: Brannden Moss;
** Assignment: Lab 11;
** Due Date: November 4,2015;

* GRADE: 21/22;


*#30);
data hotel;
	infile "C:\Users\cfeeley\Desktop\Lab Info\Hotel.dat";
	input rmNum @7 guest @12 inMo @15 inDay @18 inYr @26 outMo @29 outDay @33 outYr 
	@41 intI $ @48 intDays 48-51 @52 rmDesc $15. @68 rmRte;
	inDate = MDY(inMo,inDay,inYr); 
	outDate = MDY(outMo,outDay,outYr);
	dateDiff = DATDIF(inDate, outDate, 'act/act');
	
	if intI = "YES" then intInd = 1; 
	else intInd = 0;
	if intDays = . then intDays = 0;
	
	guestCost = (guest-1)*(10*dateDiff);
	internetCost = (9.95*intInd)+(4.95*intDays);
	subtotal = guestCost + internetCost + rmRte*dateDiff;
	grandTotal = subtotal+ subtotal*0.0775;
	
	
	drop inMo 	inDay 	inYr 	outMo 	outDay 	outYr 	intI
	guest 	intDays 	rmDesc rmRte dateDiff 	intInd 	guestCost 	internetCost; 
	format inDate outDate MMDDYY.;
*the total for room 211 is  $1357.65; 
run; 
proc print data= hotel;
run;

*33);
data rosebowl;
	infile "C:\Users\cfeeley\Desktop\Lab Info\RoseBowl.dat";
	input gameday anydtdte10. winningTeam $24. winningScore losingTeam $24. losingScore; 
	gamedate = weekday(gameday);
	scoreDif = winningScore-losingScore;
	 
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
	format gameday mmddyy.;
	/* needed day of the week in the format, -1*/
	drop tempTeam  	 	winningScore 	 	losingScore;
	
run; 
proc print data = rosebowl;
run; 

*The first Rosebowl victory that was won by USC had a difference of 11 points.;
*Sorry Caiti, time crunched so no witty commentary for this lab; 

* I appreciate you spelling my name right so that was good enough! haha;
