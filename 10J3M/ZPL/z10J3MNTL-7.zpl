set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.3641, <2> 16.4205, <3> 21.014, <4> 31.037, <5> 24.8066, <6> 38.03, <7> 29.9275, <8> 29.9555, <9> 28.7708, <10> 16.398;
param workload[JOB] := <1> 31.3641, <2> 16.4205, <3> 21.014, <4> 31.037, <5> 24.8066, <6> 38.03, <7> 29.9275, <8> 29.9555, <9> 28.7708, <10> 16.398;
param capacity[MACHINE] := <1> 66.931, <2> 66.931, <3> 66.931;

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
