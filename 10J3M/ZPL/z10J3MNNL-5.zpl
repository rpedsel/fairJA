set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.3722, <2> 30.7558, <3> 21.6476, <4> 38.2717, <5> 33.2357, <6> 23.3184, <7> 27.7678, <8> 35.6693, <9> 20.2768, <10> 21.2543;
param workload[JOB] := <1> 17.3722, <2> 30.7558, <3> 21.6476, <4> 38.2717, <5> 33.2357, <6> 23.3184, <7> 27.7678, <8> 35.6693, <9> 20.2768, <10> 21.2543;
param capacity[MACHINE] := <1> 269.5696, <2> 269.5696, <3> 269.5696;

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
