set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.7325, <2> 3.9708, <3> 34.3016, <4> 39.0614, <5> 3.4716, <6> 19.3334, <7> 40.9674, <8> 11.3468, <9> 6.9596, <10> 3.9983;
param workload[JOB] := <1> 45.7325, <2> 3.9708, <3> 34.3016, <4> 39.0614, <5> 3.4716, <6> 19.3334, <7> 40.9674, <8> 11.3468, <9> 6.9596, <10> 3.9983;
param capacity[MACHINE] := <1> 209.1434, <2> 209.1434, <3> 209.1434;

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
