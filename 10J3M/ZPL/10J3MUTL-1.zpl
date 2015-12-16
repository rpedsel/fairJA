set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.5264, <2> 9.736, <3> 24.4241, <4> 7.1358, <5> 7.3482, <6> 47.9952, <7> 23.6899, <8> 18.2504, <9> 48.3202, <10> 13.8378;
param workload[JOB] := <1> 13.5264, <2> 9.736, <3> 24.4241, <4> 7.1358, <5> 7.3482, <6> 47.9952, <7> 23.6899, <8> 18.2504, <9> 48.3202, <10> 13.8378;
param capacity[MACHINE] := <1> 53.566, <2> 53.566, <3> 53.566;

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
