set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.8002, <2> 14.2354, <3> 32.2236, <4> 25.4819, <5> 24.1928, <6> 33.0626, <7> 22.003, <8> 23.8706, <9> 25.2789, <10> 22.2718;
param workload[JOB] := <1> 432.6483, <2> 202.6466, <3> 1038.3604, <4> 649.3272, <5> 585.2916, <6> 1093.1355, <7> 484.132, <8> 569.8055, <9> 639.0228, <10> 496.0331;
param capacity[MACHINE] := <1> 6190.403, <2> 6190.403, <3> 6190.403;

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
