set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.2548, <2> 9.6857, <3> 17.2853, <4> 5.2396, <5> 40.8813, <6> 26.8802, <7> 9.5296, <8> 5.5191, <9> 46.7957, <10> 6.5761;
param workload[JOB] := <1> 21.7377, <2> 26.2025, <3> 25.8049, <4> 12.2923, <5> 0.5291, <6> 49.6357, <7> 11.4608, <8> 26.3272, <9> 16.3093, <10> 16.787;
param capacity[MACHINE] := <1> 51.7716, <2> 51.7716, <3> 51.7716;

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
