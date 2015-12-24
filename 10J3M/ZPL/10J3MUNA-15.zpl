set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.2666, <2> 22.1583, <3> 5.4211, <4> 2.9892, <5> 47.3683, <6> 48.6286, <7> 11.2221, <8> 23.4175, <9> 37.1776, <10> 48.8405;
param workload[JOB] := <1> 333.6687, <2> 490.9903, <3> 29.3883, <4> 8.9353, <5> 2243.7558, <6> 2364.7407, <7> 125.9355, <8> 548.3793, <9> 1382.1739, <10> 2385.3944;
param capacity[MACHINE] := <1> 9913.3622, <2> 9913.3622, <3> 9913.3622;

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
