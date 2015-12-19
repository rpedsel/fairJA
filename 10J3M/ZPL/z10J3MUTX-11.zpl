set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.8637, <2> 13.8154, <3> 10.5077, <4> 19.8206, <5> 33.2459, <6> 45.4571, <7> 3.0724, <8> 16.6449, <9> 29.7467, <10> 19.8234;
param workload[JOB] := <1> 3.8553, <2> 3.7169, <3> 3.2416, <4> 4.452, <5> 5.7659, <6> 6.7422, <7> 1.7528, <8> 4.0798, <9> 5.4541, <10> 4.4523;
param capacity[MACHINE] := <1> 10.8782, <2> 10.8782, <3> 10.8782;

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
