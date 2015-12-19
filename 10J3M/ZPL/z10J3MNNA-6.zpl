set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.6455, <2> 20.7279, <3> 24.858, <4> 29.7572, <5> 29.699, <6> 22.1897, <7> 19.5818, <8> 20.2578, <9> 26.6568, <10> 15.3656;
param workload[JOB] := <1> 820.5647, <2> 429.6458, <3> 617.9202, <4> 885.491, <5> 882.0306, <6> 492.3828, <7> 383.4469, <8> 410.3785, <9> 710.585, <10> 236.1017;
param capacity[MACHINE] := <1> 5868.5472, <2> 5868.5472, <3> 5868.5472;

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
