set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.7096, <2> 32.5414, <3> 19.5088, <4> 44.1833, <5> 21.2567, <6> 21.1176, <7> 34.6794, <8> 3.2927, <9> 4.4287, <10> 27.2246;
param workload[JOB] := <1> 33.2324, <2> 47.0574, <3> 37.788, <4> 22.3124, <5> 31.2043, <6> 36.3941, <7> 40.4649, <8> 29.0069, <9> 18.6774, <10> 21.9973;
param capacity[MACHINE] := <1> 79.5337, <2> 79.5337, <3> 79.5337;

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
