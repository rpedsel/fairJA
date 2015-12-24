set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0705, <2> 27.5019, <3> 27.2588, <4> 24.6687, <5> 21.0995, <6> 22.0346, <7> 29.2189, <8> 29.5346, <9> 33.7686, <10> 32.7037;
param workload[JOB] := <1> 18.9343, <2> 6.6725, <3> 29.9239, <4> 40.4049, <5> 28.0788, <6> 45.4695, <7> 46.0327, <8> 15.2199, <9> 4.3805, <10> 46.2327;
param capacity[MACHINE] := <1> 70.3374, <2> 70.3374, <3> 70.3374;

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
