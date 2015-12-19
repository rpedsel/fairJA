set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.5407, <2> 44.1214, <3> 30.6182, <4> 33.1058, <5> 14.3909, <6> 26.0622, <7> 30.5402, <8> 34.9083, <9> 33.34, <10> 6.2938;
param workload[JOB] := <1> 28.3008, <2> 39.9425, <3> 8.4633, <4> 8.6127, <5> 32.7585, <6> 36.6068, <7> 2.9965, <8> 37.2194, <9> 14.0032, <10> 0.4695;
param capacity[MACHINE] := <1> 69.7911, <2> 69.7911, <3> 69.7911;

var x[JM] binary;
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
