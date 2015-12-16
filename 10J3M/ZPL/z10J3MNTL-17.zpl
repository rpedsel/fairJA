set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7654, <2> 25.3647, <3> 28.3927, <4> 30.7495, <5> 23.3271, <6> 26.263, <7> 26.3975, <8> 20.8674, <9> 19.2602, <10> 28.7352;
param workload[JOB] := <1> 25.7654, <2> 25.3647, <3> 28.3927, <4> 30.7495, <5> 23.3271, <6> 26.263, <7> 26.3975, <8> 20.8674, <9> 19.2602, <10> 28.7352;
param capacity[MACHINE] := <1> 63.7807, <2> 63.7807, <3> 63.7807;

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
