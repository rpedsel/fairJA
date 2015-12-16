set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.6835, <2> 20.9762, <3> 28.135, <4> 27.0494, <5> 18.7205, <6> 25.4614, <7> 27.0731, <8> 24.6837, <9> 27.2175, <10> 28.0332;
param workload[JOB] := <1> 4.3224, <2> 4.58, <3> 5.3042, <4> 5.2009, <5> 4.3267, <6> 5.0459, <7> 5.2032, <8> 4.9683, <9> 5.217, <10> 5.2946;
param capacity[MACHINE] := <1> 16.4877, <2> 16.4877, <3> 16.4877;

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
