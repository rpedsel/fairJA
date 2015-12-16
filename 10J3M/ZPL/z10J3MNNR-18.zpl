set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8375, <2> 23.1841, <3> 17.6508, <4> 22.1637, <5> 34.6983, <6> 27.221, <7> 23.299, <8> 21.3603, <9> 25.8151, <10> 29.1431;
param workload[JOB] := <1> 41.0782, <2> 47.9037, <3> 13.9079, <4> 18.6969, <5> 12.2155, <6> 39.201, <7> 25.2439, <8> 47.8997, <9> 31.7851, <10> 38.404;
param capacity[MACHINE] := <1> 316.3359, <2> 316.3359, <3> 316.3359;

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
