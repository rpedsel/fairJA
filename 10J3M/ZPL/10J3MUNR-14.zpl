set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0323, <2> 20.7732, <3> 46.7675, <4> 9.9102, <5> 4.5116, <6> 35.6133, <7> 6.8344, <8> 43.6596, <9> 2.5428, <10> 2.1509;
param workload[JOB] := <1> 47.466, <2> 32.2327, <3> 18.5253, <4> 31.7858, <5> 11.8229, <6> 12.0086, <7> 10.7246, <8> 49.109, <9> 30.242, <10> 38.6301;
param capacity[MACHINE] := <1> 282.547, <2> 282.547, <3> 282.547;

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
