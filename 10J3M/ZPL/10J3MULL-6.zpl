set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.3723, <2> 46.8002, <3> 35.3349, <4> 9.8224, <5> 44.1085, <6> 13.014, <7> 35.6908, <8> 48.9197, <9> 28.8515, <10> 34.3722;
param workload[JOB] := <1> 47.3723, <2> 46.8002, <3> 35.3349, <4> 9.8224, <5> 44.1085, <6> 13.014, <7> 35.6908, <8> 48.9197, <9> 28.8515, <10> 34.3722;
param capacity[MACHINE] := <1> 114.7622, <2> 114.7622, <3> 114.7622;

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
