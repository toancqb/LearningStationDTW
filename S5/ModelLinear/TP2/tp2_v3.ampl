set PUB;
param budget_limited >= 0;
param prix_pub {PUB} >= 0;
param nbperson_pub {PUB} >= 0;
param qt_limit {PUB} >= 0;
param nbperson_semain_limited >= 0;
param nbperson_semain_pub {PUB} >= 0;

var x {p in PUB} integer >= qt_limit [p];

maximize z :
	sum {p in PUB} x [p] * nbperson_pub [p];

subject to budget_limit :
	sum {p in PUB} x [p] * prix_pub [p] <= budget_limited;

subject to nbperson_semain_limit : 
	sum {p in PUB} x [p] * nbperson_semain_pub [p] <= nbperson_semain_limited;

data;
set PUB := tv mag radio;
param budget_limited := 1000000;
param nbperson_semain_limited := 100;
param: qt_limit  prix_pub  nbperson_pub nbperson_semain_pub :=
tv        10      20000      1800000           1
mag        0      10000      1000000           3
radio      0       2000       250000           1;
