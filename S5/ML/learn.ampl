set TEST;

param N >= 0;

var x >= 0;

maximize z:
	x;

subject to d:
	x <= N;

data;

param N := 2;