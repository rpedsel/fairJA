set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.6064, <2> 45.2728, <3> 3.4093, <4> 5.2459, <5> 38.5271, <6> 47.3975, <7> 33.3841, <8> 26.4809, <9> 39.4821, <10> 26.8521;
param workload[JOB] := <1> 14.0263, <2> 41.9645, <3> 10.2915, <4> 4.4358, <5> 4.8239, <6> 13.2757, <7> 37.5724, <8> 5.6942, <9> 45.0919, <10> 49.3969;
param capacity[MACHINE] := <1> 226.5731, <2> 226.5731, <3> 226.5731;

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
