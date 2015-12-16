set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5916, <2> 30.7263, <3> 10.2227, <4> 28.7847, <5> 18.5007, <6> 10.5405, <7> 41.9779, <8> 30.8929, <9> 38.1908, <10> 41.8178;
param workload[JOB] := <1> 1.608, <2> 42.3085, <3> 0.8857, <4> 38.2928, <5> 30.1425, <6> 49.2136, <7> 25.1638, <8> 6.732, <9> 12.5687, <10> 13.8342;
param capacity[MACHINE] := <1> 55.1875, <2> 55.1875, <3> 55.1875;

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
