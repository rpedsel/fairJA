set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3187, <2> 17.8354, <3> 23.464, <4> 28.838, <5> 26.9263, <6> 24.7577, <7> 17.0209, <8> 27.2758, <9> 26.5858, <10> 22.9594;
param workload[JOB] := <1> 26.3187, <2> 17.8354, <3> 23.464, <4> 28.838, <5> 26.9263, <6> 24.7577, <7> 17.0209, <8> 27.2758, <9> 26.5858, <10> 22.9594;
param capacity[MACHINE] := <1> 241.982, <2> 241.982, <3> 241.982;

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
