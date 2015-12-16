set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.437, <2> 30.201, <3> 24.5481, <4> 23.9471, <5> 17.2883, <6> 23.6419, <7> 22.0286, <8> 32.4086, <9> 29.4939, <10> 15.5303;
param workload[JOB] := <1> 21.437, <2> 30.201, <3> 24.5481, <4> 23.9471, <5> 17.2883, <6> 23.6419, <7> 22.0286, <8> 32.4086, <9> 29.4939, <10> 15.5303;
param capacity[MACHINE] := <1> 80.1749, <2> 80.1749, <3> 80.1749;

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
