set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.2833, <2> 41.1682, <3> 32.2105, <4> 47.3243, <5> 14.6122, <6> 43.893, <7> 49.8454, <8> 31.1489, <9> 36.5525, <10> 21.043;
param workload[JOB] := <1> 799.9451, <2> 1694.8207, <3> 1037.5163, <4> 2239.5894, <5> 213.5164, <6> 1926.5954, <7> 2484.5639, <8> 970.254, <9> 1336.0853, <10> 442.8078;
param capacity[MACHINE] := <1> 3286.4236, <2> 3286.4236, <3> 3286.4236;

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
