set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.8344, <2> 19.8047, <3> 17.584, <4> 8.4396, <5> 3.4837, <6> 0.3381, <7> 0.2849, <8> 25.1279, <9> 33.4278, <10> 0.5202;
param workload[JOB] := <1> 35.8344, <2> 19.8047, <3> 17.584, <4> 8.4396, <5> 3.4837, <6> 0.3381, <7> 0.2849, <8> 25.1279, <9> 33.4278, <10> 0.5202;
param capacity[MACHINE] := <1> 144.8453, <2> 144.8453, <3> 144.8453;

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
