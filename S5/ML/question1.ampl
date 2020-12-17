
set PROD;

param poid_produit >= 0;
param volume_produit >= 0;
param poid_limite >= 0;
param volume_limite >= 0;
set MAGS := 1 .. 4;
param stock_voulu{MAGS} >= 0;
param stock_samedi{MAGS} >= 0;
var stock_lundi{MAGS} >= 0;

#param stock_diff{MAGS};

var charge{MAGS} >= 0;
var decharge{MAGS} >= 0;

maximize objectif:
	1;

#subject to stock_lundi_assign {m in MAGS}:
#	stock_lundi[m] =
#		if m != 1 then	 
#			stock_samedi[m] + decharge[m] - charge[m]
#		else
#			stock_samedi[1] - charge[1] + decharge[1] + decharge[4];

#subject to stock_samedi_return:
#	stock_lundi[4] = stock_samedi[1] - charge[1] + decharge[1] + decharge[4];

subject to precharge {m in MAGS}:
	charge[m] <= stock_samedi[m];

subject to predecharge {m in {2 .. 4}}:
	decharge[m] <= charge[m-1];

subject to reorganisation_init:
	decharge[1] = 0;

subject to reorganisation_final:
	charge[4] = 0;

subject to decharge_the_charge {m in {2 .. 4}}:
		decharge[m] = charge[m-1] - charge[m];

subject to charge_poid_limite {m in MAGS}:	
	charge[m] * poid_produit <= poid_limite;

subject to charge_volume_limite {m in MAGS}:
	charge[m] * volume_produit <= volume_limite;

subject to stock_before_return:
	stock_samedi[4] = stock_samedi[1] - charge[1];

subject to stock_lundi_constrainte {m in {1 .. 3}}:
	stock_voulu[m] <=
		if m != 1 then
			stock_samedi[m] + decharge[m] - charge[m]
		else
			stock_samedi[1] - charge[1] + decharge[1] + decharge[4];


data;
set PROD := carotte;
#param: poid_produit volume_produit poid_limite volume_limite := 1 0.8 35 100;
param poid_produit := 1;
param volume_produit := 0.8;
param poid_limite := 35;
param volume_limite := 100;
param stock_voulu :=
 1 25
 2 25
 3 25
 4 25;
param stock_samedi := 
 1 10
 2 20
 3 50
 4 10;