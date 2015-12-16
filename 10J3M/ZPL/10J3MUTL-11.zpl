set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.9293, <2> 23.7305, <3> 48.3047, <4> 29.7909, <5> 18.6727, <6> 7.8167, <7> 6.0791, <8> 15.9169, <9> 6.8064, <10> 44.2319;
param workload[JOB] := <1> 34.9293, <2> 23.7305, <3> 48.3047, <4> 29.7909, <5> 18.6727, <6> 7.8167, <7> 6.0791, <8> 15.9169, <9> 6.8064, <10> 44.2319;
param capacity[MACHINE] := <1> 59.0698, <2> 59.0698, <3> 59.0698;

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
