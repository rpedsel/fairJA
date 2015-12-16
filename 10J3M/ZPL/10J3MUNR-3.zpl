set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.4012, <2> 37.8601, <3> 21.1376, <4> 35.3931, <5> 47.2388, <6> 7.2718, <7> 34.4318, <8> 6.8566, <9> 25.0086, <10> 26.5859;
param workload[JOB] := <1> 22.6308, <2> 5.6151, <3> 44.5017, <4> 24.6784, <5> 27.2991, <6> 24.5818, <7> 7.7918, <8> 47.7608, <9> 23.7497, <10> 10.3777;
param capacity[MACHINE] := <1> 238.9869, <2> 238.9869, <3> 238.9869;

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
