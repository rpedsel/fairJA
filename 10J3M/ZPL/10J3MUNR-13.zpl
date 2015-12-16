set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2476, <2> 24.7793, <3> 32.809, <4> 44.711, <5> 11.6084, <6> 14.4365, <7> 44.1222, <8> 40.711, <9> 8.9896, <10> 10.9469;
param workload[JOB] := <1> 43.6493, <2> 27.0894, <3> 29.9601, <4> 17.886, <5> 29.9772, <6> 46.0614, <7> 46.8667, <8> 6.2229, <9> 4.6012, <10> 34.2916;
param capacity[MACHINE] := <1> 286.6058, <2> 286.6058, <3> 286.6058;

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
