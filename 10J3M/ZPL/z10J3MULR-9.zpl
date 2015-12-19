set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.3928, <2> 32.5835, <3> 6.887, <4> 15.3059, <5> 44.3287, <6> 10.4229, <7> 6.3243, <8> 14.7596, <9> 49.063, <10> 0.391;
param workload[JOB] := <1> 43.4709, <2> 22.7164, <3> 38.775, <4> 44.6682, <5> 22.0466, <6> 31.6806, <7> 10.1653, <8> 15.918, <9> 13.3565, <10> 37.9473;
param capacity[MACHINE] := <1> 93.5816, <2> 93.5816, <3> 93.5816;

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
