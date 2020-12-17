
set PROD;

param poid_produit{PROD} >= 0;
param volume_produit{PROD} >= 0;
param poid_limite >= 0;
param volume_limite >= 0;
set MAGS := 1 .. 4;
param stock_voulu{MAGS, PROD} >= 0;
param stock_samedi{MAGS, PROD} >= 0;

var stock_lundi{MAGS, PROD} >= 0;
var charge{MAGS, PROD} >= 0;
var decharge{MAGS, PROD} >= 0;
var balo{0 .. 4} >= 0;

maximize objectif:
	1;


subject to reorganisation_de {p in PROD}:
	decharge[4,p] = balo[3,p];

subject to reorganisation_def:
	balo[4] = 0;

subject to reorganisation_final:
	charge[4] = 0;

subject to balo_init:
	balo[0] = 0;

subject to assign_balo {m in {1 .. 3}}:
	balo[m] = balo[m-1] + charge[m] - decharge[m];

subject to poid_constraint {m in MAGS}:
	balo[m] * poid_produit <= poid_limite;

subject to volume_constraint {m in MAGS}:
	balo[m] * volume_produit <= volume_limite;

subject to precharge {m in MAGS}:
	charge[m] <= stock_samedi[m];

subject to predecharge {m in MAGS}:
	decharge[m] <= balo[m-1];

subject to stock_lundi_constrainte {m in {2 .. 4}}:
	stock_voulu[m] <= 
		if m != 4 then
			stock_samedi[m] - charge[m] + decharge[m]
		else
			stock_samedi[1] - charge[1] - charge[m] + decharge[m];
		

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
 2 15
 3 50
 4 10;