set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.5796, <2> 15.4968, <3> 7.0891, <4> 0.6032, <5> 22.3137, <6> 19.8386, <7> 33.2459, <8> 18.8287, <9> 24.8072, <10> 47.3037;
param workload[JOB] := <1> 2263.8183, <2> 240.1508, <3> 50.2553, <4> 0.3639, <5> 497.9012, <6> 393.57, <7> 1105.2899, <8> 354.5199, <9> 615.3972, <10> 2237.64;
param capacity[MACHINE] := <1> 2586.3022, <2> 2586.3022, <3> 2586.3022;

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
