set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.3989, <2> 38.7316, <3> 47.3865, <4> 32.006, <5> 32.5311, <6> 16.3553, <7> 35.0085, <8> 38.8137, <9> 10.9533, <10> 49.5343;
param workload[JOB] := <1> 17.6382, <2> 19.54, <3> 23.7807, <4> 14.7636, <5> 4.2559, <6> 48.5864, <7> 20.4382, <8> 34.0396, <9> 42.0996, <10> 17.9762;
param capacity[MACHINE] := <1> 60.7796, <2> 60.7796, <3> 60.7796;

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
