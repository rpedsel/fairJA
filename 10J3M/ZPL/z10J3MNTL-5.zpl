set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.5246, <2> 20.4233, <3> 34.5956, <4> 37.4289, <5> 17.2168, <6> 20.0928, <7> 30.2037, <8> 29.0482, <9> 25.7467, <10> 14.6788;
param workload[JOB] := <1> 22.5246, <2> 20.4233, <3> 34.5956, <4> 37.4289, <5> 17.2168, <6> 20.0928, <7> 30.2037, <8> 29.0482, <9> 25.7467, <10> 14.6788;
param capacity[MACHINE] := <1> 62.9899, <2> 62.9899, <3> 62.9899;

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
