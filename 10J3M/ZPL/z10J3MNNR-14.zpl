set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.6379, <2> 34.5761, <3> 20.6458, <4> 19.2838, <5> 29.4691, <6> 28.3205, <7> 17.2289, <8> 13.3605, <9> 21.698, <10> 39.9325;
param workload[JOB] := <1> 23.2555, <2> 18.6877, <3> 37.2579, <4> 15.9397, <5> 16.2965, <6> 21.6231, <7> 16.0882, <8> 12.8032, <9> 42.1144, <10> 41.0461;
param capacity[MACHINE] := <1> 245.1123, <2> 245.1123, <3> 245.1123;

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
