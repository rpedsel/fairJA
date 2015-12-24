set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.4794, <2> 23.676, <3> 5.6548, <4> 48.5249, <5> 37.4969, <6> 17.4697, <7> 13.1998, <8> 20.8203, <9> 29.1199, <10> 47.4937;
param workload[JOB] := <1> 109.8178, <2> 560.553, <3> 31.9768, <4> 2354.6659, <5> 1406.0175, <6> 305.1904, <7> 174.2347, <8> 433.4849, <9> 847.9686, <10> 2255.6515;
param capacity[MACHINE] := <1> 2641.9892, <2> 2641.9892, <3> 2641.9892;

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
