set PUB;
param budget_limited >= 0;
param prix_tv >= 0;
param prix_mag >= 0;
param nbperson_tv >= 0;
param nbperson_mag >= 0;

var xtv >= 10;
var xmag >= 0;

maximize z : xtv * nbperson_tv + xmag * nbperson_mag;

subject to budget_limit : xtv * prix_tv + xmag * prix_mag <= budget_limited;

data;
set PUB;
param budget_limited := 1000000;
param prix_tv := 20000;
param prix_mag := 10000;
param nbperson_tv := 1800000;
param nbperson_mag := 1000000;
