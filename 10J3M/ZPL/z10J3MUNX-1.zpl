set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.6334, <2> 25.7443, <3> 41.1633, <4> 37.6946, <5> 4.4024, <6> 38.4844, <7> 2.4467, <8> 13.6752, <9> 13.9567, <10> 36.0079;
param workload[JOB] := <1> 6.2955, <2> 5.0739, <3> 6.4159, <4> 6.1396, <5> 2.0982, <6> 6.2036, <7> 1.5642, <8> 3.698, <9> 3.7359, <10> 6.0007;
param capacity[MACHINE] := <1> 47.2255, <2> 47.2255, <3> 47.2255;

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
