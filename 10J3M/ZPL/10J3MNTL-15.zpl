set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.3582, <2> 29.6255, <3> 35.6028, <4> 28.3648, <5> 27.5639, <6> 21.7368, <7> 20.0018, <8> 16.6506, <9> 26.9394, <10> 30.208;
param workload[JOB] := <1> 20.3582, <2> 29.6255, <3> 35.6028, <4> 28.3648, <5> 27.5639, <6> 21.7368, <7> 20.0018, <8> 16.6506, <9> 26.9394, <10> 30.208;
param capacity[MACHINE] := <1> 64.2629, <2> 64.2629, <3> 64.2629;

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
