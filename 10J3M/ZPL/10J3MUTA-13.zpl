set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6067, <2> 38.6744, <3> 48.9331, <4> 43.535, <5> 39.7323, <6> 31.3503, <7> 32.0275, <8> 46.9838, <9> 21.83, <10> 5.6116;
param workload[JOB] := <1> 707.9165, <2> 1495.7092, <3> 2394.4483, <4> 1895.2962, <5> 1578.6557, <6> 982.8413, <7> 1025.7608, <8> 2207.4775, <9> 476.5489, <10> 31.4901;
param capacity[MACHINE] := <1> 3199.0361, <2> 3199.0361, <3> 3199.0361;

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
