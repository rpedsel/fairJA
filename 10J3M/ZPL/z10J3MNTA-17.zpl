set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.3384, <2> 31.6779, <3> 22.9305, <4> 24.3894, <5> 25.929, <6> 22.6145, <7> 21.923, <8> 23.1346, <9> 29.6333, <10> 23.8161;
param workload[JOB] := <1> 803.0649, <2> 1003.4893, <3> 525.8078, <4> 594.8428, <5> 672.313, <6> 511.4156, <7> 480.6179, <8> 535.2097, <9> 878.1325, <10> 567.2066;
param capacity[MACHINE] := <1> 1643.025, <2> 1643.025, <3> 1643.025;

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
