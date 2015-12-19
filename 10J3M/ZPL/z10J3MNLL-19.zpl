set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.1147, <2> 24.4191, <3> 19.7924, <4> 27.8807, <5> 19.5854, <6> 26.3428, <7> 14.3326, <8> 22.266, <9> 25.4433, <10> 24.8378;
param workload[JOB] := <1> 30.1147, <2> 24.4191, <3> 19.7924, <4> 27.8807, <5> 19.5854, <6> 26.3428, <7> 14.3326, <8> 22.266, <9> 25.4433, <10> 24.8378;
param capacity[MACHINE] := <1> 78.3383, <2> 78.3383, <3> 78.3383;

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
