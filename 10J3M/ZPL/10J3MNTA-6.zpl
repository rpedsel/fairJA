set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.9001, <2> 26.9231, <3> 30.5518, <4> 16.7597, <5> 26.394, <6> 23.3944, <7> 24.3865, <8> 22.2963, <9> 24.3669, <10> 26.0728;
param workload[JOB] := <1> 320.4136, <2> 724.8533, <3> 933.4125, <4> 280.8875, <5> 696.6432, <6> 547.298, <7> 594.7014, <8> 497.125, <9> 593.7458, <10> 679.7909;
param capacity[MACHINE] := <1> 1467.2178, <2> 1467.2178, <3> 1467.2178;

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
