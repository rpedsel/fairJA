set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.8851, <2> 29.7159, <3> 11.8222, <4> 18.7333, <5> 14.0694, <6> 46.8963, <7> 13.7356, <8> 17.739, <9> 5.9108, <10> 3.787;
param workload[JOB] := <1> 141.2556, <2> 883.0347, <3> 139.7644, <4> 350.9365, <5> 197.948, <6> 2199.263, <7> 188.6667, <8> 314.6721, <9> 34.9376, <10> 14.3414;
param capacity[MACHINE] := <1> 2521.8753, <2> 2521.8753, <3> 2521.8753;

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
