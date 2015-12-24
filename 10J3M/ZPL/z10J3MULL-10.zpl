set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.6353, <2> 23.3607, <3> 7.7764, <4> 40.4512, <5> 1.7073, <6> 6.7204, <7> 46.0141, <8> 20.4268, <9> 48.9912, <10> 15.447;
param workload[JOB] := <1> 47.6353, <2> 23.3607, <3> 7.7764, <4> 40.4512, <5> 1.7073, <6> 6.7204, <7> 46.0141, <8> 20.4268, <9> 48.9912, <10> 15.447;
param capacity[MACHINE] := <1> 86.1768, <2> 86.1768, <3> 86.1768;

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
