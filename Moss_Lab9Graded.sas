** Name: Brannden Moss;
** Assignment: Lab 9;
** Due Date: October 27,2015;


* GRADE: 30/30;
* Awesome work!;

* #1); 
data trees; 
input names $ strength; 
datalines; 
Douglas-Fir 65 
Douglas-Fir 46 
Douglas-Fir 52 
Douglas-Fir 39
Douglas-Fir 41 
Douglas-Fir 44
Hem-Fir 45 
Hem-Fir 48 
Hem-Fir 32 
Hem-Fir 30 
Hem-Fir 47 
Hem-Fir 50
SprucePine-Fir 42 
SprucePine-Fir 38 
SprucePine-Fir 30 
SprucePine-Fir 28 
SprucePine-Fir 39 
SprucePine-Fir 40
;
run; 

proc anova data= trees; 
	class names; 
	model strength = names;
	*means names/ hovtest tukey;
	** unneccisarry due to hyp test;
	title "ANOVA FOR TREES Strength";
run; 
quit; 

/*
Ho: There is no difference in the mean bending strengths among the 
	three types of wood 
Ha: There is at least one difference in the mean bending strengths among the 
	three types of wood 

F = 3.07
pvalue = 0.0763
fail to reject

At the significance level of .05, I fail to reject that there is no  difference in the mean bending strengths among the 
	three types of wood.

*/ 

*#2); 

data pegs; 
input degrees $ strength; 
datalines; 
0deg 17.7 
0deg 17.4 
0deg 17.1 
0deg 17.3 
0deg 16.8 
0deg 22.4 
0deg 22.3 
0deg 20.4
45deg 22.0 
45deg 18.7 
45deg 20.5 
45deg 19.5 
45deg 17.4 
45deg 22.0 
45deg 19.4 
45deg 18.3
90deg 19.3 
90deg 20.8 
90deg 27.5 
90deg 19.6 
90deg 19.3 
90deg 22.3 
90deg 22.9 
90deg 19.6
;
run; 

proc anova data= pegs; 
	class degrees; 
	model strength = degrees;
	*means degrees/ hovtest tukey;
	title "ANOVA FOR TREES pegs";
run;

/*
Ho: There is no difference in the  the mean bearing strength of the pegs 
affected by the orientation of the pegs 

Ha: There is at least one difference in the mean bearing strength of the pegs 
affected by the orientation of the pegs 

F = 2.35
pvalue = 0.1203
fail to reject

At the significance level of .05, I fail to reject that there is no difference in
the mean strength of the pegs affected by the orientation of the pegs. 
*/ 

*#3); 
data aged; 
input age brouseTime; 
datalines;
22 492 
50 186 
44 180 
32 384 
55 120 
60 120
38 276 
22 480 
21 510 
45 252 
52 126 
33 360 
19 570 
17 588 
21 498
; 
run; 

proc sgplot data= aged; 
	scatter y = brouseTime x = Age;
	title "Aged scatter";
run;
/* I think that the linear model is appropriate for this data because the
regression fits for these data points, the F test had a value of 391, leading
to a pvalue of <.001, and an r value of .96 */

proc reg data = aged; 
	model brouseTime = age; 
	title "regression of age on brouse time"; 
run; 
quit; 

/* predicted brouse time = 750.02072 - 11.50341(Age)
it fits the model really well, same with the above that is included F. */



