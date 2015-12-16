set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.6708, <2> 24.5827, <3> 32.2372, <4> 14.51, <5> 27.6711, <6> 22.0869, <7> 26.405, <8> 26.7521, <9> 28.1732, <10> 27.6058;
param workload[JOB] := <1> 28.5012, <2> 33.8292, <3> 19.4889, <4> 22.2816, <5> 13.3926, <6> 26.6083, <7> 7.9324, <8> 23.0572, <9> 43.7367, <10> 46.9238;
param capacity[MACHINE] := <1> 88.584, <2> 88.584, <3> 88.584;

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
