set PUB;
param budget_limited >= 0;
param prix_pub {PUB} >= 0;
param nbperson_pub {PUB} >= 0;
param qt_limit {PUB} >= 0;

var x {p in PUB} >= qt_limit [p];

maximize z :
	sum {p in PUB} x [p] * nbperson_pub [p];

subject to budget_limit :
	sum {p in PUB} x [p] * prix_pub [p] <= budget_limited;

data;
set PUB := tv mag;
param budget_limited := 1000000;
param: qt_limit  prix_pub  nbperson_pub :=
tv        10      20000      1800000
mag        0      10000      1000000;  
