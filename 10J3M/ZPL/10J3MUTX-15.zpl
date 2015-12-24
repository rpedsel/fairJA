set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.4881, <2> 38.8331, <3> 10.4828, <4> 40.1578, <5> 37.3807, <6> 46.216, <7> 41.5868, <8> 40.9739, <9> 41.335, <10> 12.3021;
param workload[JOB] := <1> 2.7364, <2> 6.2316, <3> 3.2377, <4> 6.337, <5> 6.114, <6> 6.7982, <7> 6.4488, <8> 6.4011, <9> 6.4292, <10> 3.5074;
param capacity[MACHINE] := <1> 13.5604, <2> 13.5604, <3> 13.5604;

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
