set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.451, <2> 43.3401, <3> 2.7015, <4> 45.1629, <5> 39.8164, <6> 10.1031, <7> 19.4039, <8> 9.6279, <9> 44.5567, <10> 33.7979;
param workload[JOB] := <1> 549.9494, <2> 1878.3643, <3> 7.2981, <4> 2039.6875, <5> 1585.3457, <6> 102.0726, <7> 376.5113, <8> 92.6965, <9> 1985.2995, <10> 1142.298;
param capacity[MACHINE] := <1> 2439.8807, <2> 2439.8807, <3> 2439.8807;

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
