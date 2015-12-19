set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.7852, <2> 12.3317, <3> 46.4233, <4> 36.5724, <5> 30.8752, <6> 8.941, <7> 45.6863, <8> 21.4127, <9> 10.4055, <10> 24.3399;
param workload[JOB] := <1> 4.5591, <2> 3.5117, <3> 6.8135, <4> 6.0475, <5> 5.5565, <6> 2.9902, <7> 6.7592, <8> 4.6274, <9> 3.2258, <10> 4.9335;
param capacity[MACHINE] := <1> 49.0244, <2> 49.0244, <3> 49.0244;

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
