set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.0493, <2> 27.507, <3> 30.8773, <4> 22.908, <5> 36.332, <6> 22.1137, <7> 13.8465, <8> 28.5434, <9> 19.4913, <10> 35.6936;
param workload[JOB] := <1> 964.059, <2> 756.635, <3> 953.4077, <4> 524.7765, <5> 1320.0142, <6> 489.0157, <7> 191.7256, <8> 814.7257, <9> 379.9108, <10> 1274.0331;
param capacity[MACHINE] := <1> 7668.3033, <2> 7668.3033, <3> 7668.3033;

var x[JM];
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
