set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0518, <2> 27.1572, <3> 17.5134, <4> 15.0354, <5> 27.7867, <6> 21.8095, <7> 20.4063, <8> 30.3353, <9> 20.9528, <10> 20.9787;
param workload[JOB] := <1> 25.0518, <2> 27.1572, <3> 17.5134, <4> 15.0354, <5> 27.7867, <6> 21.8095, <7> 20.4063, <8> 30.3353, <9> 20.9528, <10> 20.9787;
param capacity[MACHINE] := <1> 227.0271, <2> 227.0271, <3> 227.0271;

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
