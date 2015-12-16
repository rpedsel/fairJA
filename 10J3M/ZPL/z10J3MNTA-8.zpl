set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4125, <2> 20.1169, <3> 22.7868, <4> 32.0157, <5> 29.5969, <6> 20.8556, <7> 23.4215, <8> 22.9874, <9> 27.4546, <10> 24.7058;
param workload[JOB] := <1> 697.6202, <2> 404.6897, <3> 519.2383, <4> 1025.005, <5> 875.9765, <6> 434.9561, <7> 548.5667, <8> 528.4206, <9> 753.7551, <10> 610.3766;
param capacity[MACHINE] := <1> 1599.6512, <2> 1599.6512, <3> 1599.6512;

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
