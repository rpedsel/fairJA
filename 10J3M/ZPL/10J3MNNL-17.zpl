set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.0357, <2> 23.8954, <3> 22.1344, <4> 26.9822, <5> 29.4631, <6> 25.7477, <7> 25.1888, <8> 23.7875, <9> 35.8147, <10> 25.764;
param workload[JOB] := <1> 17.0357, <2> 23.8954, <3> 22.1344, <4> 26.9822, <5> 29.4631, <6> 25.7477, <7> 25.1888, <8> 23.7875, <9> 35.8147, <10> 25.764;
param capacity[MACHINE] := <1> 255.8135, <2> 255.8135, <3> 255.8135;

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
