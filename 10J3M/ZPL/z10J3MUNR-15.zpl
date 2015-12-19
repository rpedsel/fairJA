set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.8379, <2> 18.3556, <3> 21.175, <4> 26.0773, <5> 18.6055, <6> 8.0589, <7> 44.4966, <8> 18.7534, <9> 44.7924, <10> 0.2037;
param workload[JOB] := <1> 26.5775, <2> 41.3149, <3> 36.5395, <4> 44.4575, <5> 43.8205, <6> 6.908, <7> 39.1856, <8> 34.6539, <9> 8.863, <10> 41.0911;
param capacity[MACHINE] := <1> 323.4115, <2> 323.4115, <3> 323.4115;

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
