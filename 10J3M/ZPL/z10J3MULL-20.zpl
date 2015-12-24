set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1261, <2> 14.3178, <3> 33.233, <4> 45.0245, <5> 40.3735, <6> 30.667, <7> 15.5728, <8> 43.7014, <9> 48.9686, <10> 21.2414;
param workload[JOB] := <1> 25.1261, <2> 14.3178, <3> 33.233, <4> 45.0245, <5> 40.3735, <6> 30.667, <7> 15.5728, <8> 43.7014, <9> 48.9686, <10> 21.2414;
param capacity[MACHINE] := <1> 106.0754, <2> 106.0754, <3> 106.0754;

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
