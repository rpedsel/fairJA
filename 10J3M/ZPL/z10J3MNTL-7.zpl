set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.8301, <2> 24.1051, <3> 31.2864, <4> 33.6112, <5> 28.4788, <6> 31.3261, <7> 16.676, <8> 26.7635, <9> 35.6654, <10> 23.7692;
param workload[JOB] := <1> 22.8301, <2> 24.1051, <3> 31.2864, <4> 33.6112, <5> 28.4788, <6> 31.3261, <7> 16.676, <8> 26.7635, <9> 35.6654, <10> 23.7692;
param capacity[MACHINE] := <1> 68.6279, <2> 68.6279, <3> 68.6279;

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
