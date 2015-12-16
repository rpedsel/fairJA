set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.8261, <2> 26.7046, <3> 28.461, <4> 24.349, <5> 35.4474, <6> 12.0124, <7> 20.3224, <8> 19.1958, <9> 4.5615, <10> 38.124;
param workload[JOB] := <1> 47.5082, <2> 45.6754, <3> 20.7302, <4> 42.6636, <5> 2.8651, <6> 26.318, <7> 8.8947, <8> 48.03, <9> 26.4305, <10> 44.6659;
param capacity[MACHINE] := <1> 78.4454, <2> 78.4454, <3> 78.4454;

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
