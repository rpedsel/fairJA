set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.5464, <2> 42.9788, <3> 43.4708, <4> 12.873, <5> 31.7612, <6> 29.8569, <7> 36.8979, <8> 37.6143, <9> 3.8362, <10> 28.995;
param workload[JOB] := <1> 39.5464, <2> 42.9788, <3> 43.4708, <4> 12.873, <5> 31.7612, <6> 29.8569, <7> 36.8979, <8> 37.6143, <9> 3.8362, <10> 28.995;
param capacity[MACHINE] := <1> 307.8305, <2> 307.8305, <3> 307.8305;

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
