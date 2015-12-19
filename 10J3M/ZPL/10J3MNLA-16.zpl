set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.2427, <2> 19.9447, <3> 26.7832, <4> 16.6675, <5> 24.3945, <6> 25.5397, <7> 33.3245, <8> 23.7614, <9> 30.5344, <10> 43.1383;
param workload[JOB] := <1> 297.3107, <2> 397.7911, <3> 717.3398, <4> 277.8056, <5> 595.0916, <6> 652.2763, <7> 1110.5223, <8> 564.6041, <9> 932.3496, <10> 1860.9129;
param capacity[MACHINE] := <1> 2468.668, <2> 2468.668, <3> 2468.668;

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
