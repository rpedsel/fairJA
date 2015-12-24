set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.5002, <2> 15.2285, <3> 24.6623, <4> 23.7311, <5> 27.8538, <6> 12.0981, <7> 31.7596, <8> 24.558, <9> 28.3978, <10> 29.0669;
param workload[JOB] := <1> 27.5002, <2> 15.2285, <3> 24.6623, <4> 23.7311, <5> 27.8538, <6> 12.0981, <7> 31.7596, <8> 24.558, <9> 28.3978, <10> 29.0669;
param capacity[MACHINE] := <1> 244.8563, <2> 244.8563, <3> 244.8563;

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
