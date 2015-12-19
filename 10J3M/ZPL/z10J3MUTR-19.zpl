set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.2807, <2> 28.111, <3> 39.3194, <4> 25.8462, <5> 19.4977, <6> 11.9939, <7> 12.9854, <8> 41.6513, <9> 2.1279, <10> 21.4108;
param workload[JOB] := <1> 30.0097, <2> 45.1715, <3> 47.8229, <4> 43.2801, <5> 0.1591, <6> 5.6844, <7> 31.6499, <8> 38.3744, <9> 47.737, <10> 44.9696;
param capacity[MACHINE] := <1> 83.7146, <2> 83.7146, <3> 83.7146;

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
