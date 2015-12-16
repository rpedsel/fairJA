set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.6682, <2> 29.9249, <3> 23.4596, <4> 22.3372, <5> 23.754, <6> 29.7982, <7> 11.8517, <8> 27.7712, <9> 23.9156, <10> 17.7424;
param workload[JOB] := <1> 24.6682, <2> 29.9249, <3> 23.4596, <4> 22.3372, <5> 23.754, <6> 29.7982, <7> 11.8517, <8> 27.7712, <9> 23.9156, <10> 17.7424;
param capacity[MACHINE] := <1> 78.4077, <2> 78.4077, <3> 78.4077;

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
