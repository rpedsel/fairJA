set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.646, <2> 33.1763, <3> 26.0643, <4> 14.7284, <5> 27.232, <6> 24.6974, <7> 16.8246, <8> 24.5268, <9> 34.7027, <10> 30.5645;
param workload[JOB] := <1> 32.646, <2> 33.1763, <3> 26.0643, <4> 14.7284, <5> 27.232, <6> 24.6974, <7> 16.8246, <8> 24.5268, <9> 34.7027, <10> 30.5645;
param capacity[MACHINE] := <1> 265.163, <2> 265.163, <3> 265.163;

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
