set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.1711, <2> 19.5967, <3> 47.1139, <4> 25.5262, <5> 20.3896, <6> 45.0722, <7> 46.9294, <8> 31.6931, <9> 14.2768, <10> 15.8407;
param workload[JOB] := <1> 10.2398, <2> 13.7477, <3> 1.586, <4> 23.3812, <5> 34.7575, <6> 19.1544, <7> 15.9025, <8> 19.6965, <9> 10.0013, <10> 8.8424;
param capacity[MACHINE] := <1> 39.3273, <2> 39.3273, <3> 39.3273;

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
