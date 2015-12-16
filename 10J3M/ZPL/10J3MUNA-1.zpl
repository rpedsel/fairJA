set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.0989, <2> 17.34, <3> 7.2052, <4> 37.1966, <5> 4.9456, <6> 11.1505, <7> 45.9117, <8> 20.0168, <9> 27.4206, <10> 46.2202;
param workload[JOB] := <1> 25.9988, <2> 300.6756, <3> 51.9149, <4> 1383.5871, <5> 24.459, <6> 124.3337, <7> 2107.8842, <8> 400.6723, <9> 751.8893, <10> 2136.3069;
param capacity[MACHINE] := <1> 7307.7218, <2> 7307.7218, <3> 7307.7218;

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
