set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.0371, <2> 34.5861, <3> 20.5644, <4> 33.965, <5> 44.4803, <6> 25.9975, <7> 10.3208, <8> 45.9346, <9> 19.1137, <10> 2.056;
param workload[JOB] := <1> 2404.6372, <2> 1196.1983, <3> 422.8945, <4> 1153.6212, <5> 1978.4971, <6> 675.87, <7> 106.5189, <8> 2109.9875, <9> 365.3335, <10> 4.2271;
param capacity[MACHINE] := <1> 3472.5951, <2> 3472.5951, <3> 3472.5951;

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
