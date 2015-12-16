set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.9133, <2> 20.3036, <3> 18.5573, <4> 47.996, <5> 20.1745, <6> 45.9893, <7> 41.8364, <8> 18.83, <9> 43.6774, <10> 4.7166;
param workload[JOB] := <1> 5.4998, <2> 19.4361, <3> 12.9762, <4> 14.8433, <5> 39.7365, <6> 38.3544, <7> 36.1715, <8> 35.5571, <9> 23.5397, <10> 19.0337;
param capacity[MACHINE] := <1> 81.7161, <2> 81.7161, <3> 81.7161;

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
