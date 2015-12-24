set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.2641, <2> 26.836, <3> 24.0504, <4> 21.8752, <5> 23.4401, <6> 26.5872, <7> 24.3474, <8> 38.5849, <9> 13.8487, <10> 26.2641;
param workload[JOB] := <1> 798.8593, <2> 720.1709, <3> 578.4217, <4> 478.5244, <5> 549.4383, <6> 706.8792, <7> 592.7959, <8> 1488.7945, <9> 191.7865, <10> 689.8029;
param capacity[MACHINE] := <1> 1698.8684, <2> 1698.8684, <3> 1698.8684;

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
