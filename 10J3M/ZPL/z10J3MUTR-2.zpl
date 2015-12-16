set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.6274, <2> 21.9533, <3> 12.4132, <4> 4.6754, <5> 27.2358, <6> 3.1956, <7> 45.2947, <8> 0.487, <9> 40.955, <10> 1.3189;
param workload[JOB] := <1> 21.1263, <2> 17.9243, <3> 3.7791, <4> 2.6186, <5> 26.386, <6> 38.4038, <7> 33.5072, <8> 16.8498, <9> 25.5552, <10> 21.291;
param capacity[MACHINE] := <1> 51.8603, <2> 51.8603, <3> 51.8603;

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
