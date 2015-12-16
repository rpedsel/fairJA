set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0009, <2> 25.3072, <3> 21.2596, <4> 21.4772, <5> 14.7984, <6> 18.6899, <7> 19.835, <8> 25.2449, <9> 25.5923, <10> 21.5658;
param workload[JOB] := <1> 24.0009, <2> 25.3072, <3> 21.2596, <4> 21.4772, <5> 14.7984, <6> 18.6899, <7> 19.835, <8> 25.2449, <9> 25.5923, <10> 21.5658;
param capacity[MACHINE] := <1> 72.5904, <2> 72.5904, <3> 72.5904;

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
