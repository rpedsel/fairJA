set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.6582, <2> 32.5211, <3> 39.7785, <4> 28.6994, <5> 3.0739, <6> 14.9637, <7> 49.0834, <8> 12.196, <9> 31.0876, <10> 27.4492;
param workload[JOB] := <1> 41.6582, <2> 32.5211, <3> 39.7785, <4> 28.6994, <5> 3.0739, <6> 14.9637, <7> 49.0834, <8> 12.196, <9> 31.0876, <10> 27.4492;
param capacity[MACHINE] := <1> 70.1278, <2> 70.1278, <3> 70.1278;

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
