set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.3836, <2> 25.2497, <3> 14.9375, <4> 29.3599, <5> 26.8788, <6> 26.8949, <7> 26.3641, <8> 30.2696, <9> 16.4069, <10> 25.7099;
param workload[JOB] := <1> 863.3959, <2> 637.5474, <3> 223.1289, <4> 862.0037, <5> 722.4699, <6> 723.3356, <7> 695.0658, <8> 916.2487, <9> 269.1864, <10> 660.999;
param capacity[MACHINE] := <1> 2191.1271, <2> 2191.1271, <3> 2191.1271;

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
