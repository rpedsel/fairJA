set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.8633, <2> 39.3437, <3> 38.2809, <4> 24.4632, <5> 15.5241, <6> 32.2895, <7> 20.7158, <8> 15.375, <9> 5.0051, <10> 35.9533;
param workload[JOB] := <1> 30.8633, <2> 39.3437, <3> 38.2809, <4> 24.4632, <5> 15.5241, <6> 32.2895, <7> 20.7158, <8> 15.375, <9> 5.0051, <10> 35.9533;
param capacity[MACHINE] := <1> 257.8139, <2> 257.8139, <3> 257.8139;

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
