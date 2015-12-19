set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1221, <2> 29.8738, <3> 23.9447, <4> 30.9163, <5> 34.9286, <6> 34.4329, <7> 17.2991, <8> 32.7634, <9> 29.3752, <10> 26.2674;
param workload[JOB] := <1> 24.1221, <2> 29.8738, <3> 23.9447, <4> 30.9163, <5> 34.9286, <6> 34.4329, <7> 17.2991, <8> 32.7634, <9> 29.3752, <10> 26.2674;
param capacity[MACHINE] := <1> 94.6412, <2> 94.6412, <3> 94.6412;

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
