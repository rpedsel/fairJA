set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.9491, <2> 25.1052, <3> 29.1745, <4> 31.0464, <5> 29.5961, <6> 14.7846, <7> 30.8, <8> 17.4348, <9> 27.8617, <10> 21.6352;
param workload[JOB] := <1> 35.991, <2> 41.7414, <3> 39.2581, <4> 30.6652, <5> 11.6276, <6> 48.2665, <7> 13.4461, <8> 15.5074, <9> 5.1715, <10> 41.2923;
param capacity[MACHINE] := <1> 282.9671, <2> 282.9671, <3> 282.9671;

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
