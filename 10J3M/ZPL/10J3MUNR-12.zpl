set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.5177, <2> 2.9226, <3> 13.6239, <4> 23.311, <5> 32.1477, <6> 13.7818, <7> 18.9489, <8> 5.9727, <9> 0.1228, <10> 15.4903;
param workload[JOB] := <1> 17.0944, <2> 0.432, <3> 14.6374, <4> 37.5267, <5> 8.282, <6> 16.6743, <7> 35.4537, <8> 2.4433, <9> 48.6605, <10> 33.6957;
param capacity[MACHINE] := <1> 214.9, <2> 214.9, <3> 214.9;

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
