set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.2839, <2> 16.3278, <3> 22.8252, <4> 36.7618, <5> 38.134, <6> 5.5073, <7> 5.7684, <8> 25.3966, <9> 40.4872, <10> 45.7798;
param workload[JOB] := <1> 6.2839, <2> 16.3278, <3> 22.8252, <4> 36.7618, <5> 38.134, <6> 5.5073, <7> 5.7684, <8> 25.3966, <9> 40.4872, <10> 45.7798;
param capacity[MACHINE] := <1> 243.272, <2> 243.272, <3> 243.272;

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
