set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.7757, <2> 36.7713, <3> 7.4753, <4> 24.9288, <5> 43.5049, <6> 17.2355, <7> 25.1526, <8> 0.5854, <9> 34.4561, <10> 10.1413;
param workload[JOB] := <1> 828.0409, <2> 1352.1285, <3> 55.8801, <4> 621.4451, <5> 1892.6763, <6> 297.0625, <7> 632.6533, <8> 0.3427, <9> 1187.2228, <10> 102.846;
param capacity[MACHINE] := <1> 6970.2982, <2> 6970.2982, <3> 6970.2982;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
