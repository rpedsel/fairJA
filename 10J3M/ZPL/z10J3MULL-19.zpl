set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.2533, <2> 0.4886, <3> 39.3101, <4> 13.2736, <5> 47.6132, <6> 1.1422, <7> 5.354, <8> 14.2847, <9> 38.7663, <10> 48.6399;
param workload[JOB] := <1> 45.2533, <2> 0.4886, <3> 39.3101, <4> 13.2736, <5> 47.6132, <6> 1.1422, <7> 5.354, <8> 14.2847, <9> 38.7663, <10> 48.6399;
param capacity[MACHINE] := <1> 84.7086, <2> 84.7086, <3> 84.7086;

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
