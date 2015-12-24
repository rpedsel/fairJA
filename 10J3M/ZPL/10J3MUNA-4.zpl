set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.936, <2> 0.827, <3> 18.5659, <4> 40.8507, <5> 35.9603, <6> 38.3926, <7> 18.8002, <8> 7.2912, <9> 35.4049, <10> 19.0802;
param workload[JOB] := <1> 1019.9081, <2> 0.6839, <3> 344.6926, <4> 1668.7797, <5> 1293.1432, <6> 1473.9917, <7> 353.4475, <8> 53.1616, <9> 1253.5069, <10> 364.054;
param capacity[MACHINE] := <1> 7825.3692, <2> 7825.3692, <3> 7825.3692;

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
