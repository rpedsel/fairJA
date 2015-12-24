set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.6683, <2> 36.2073, <3> 23.7102, <4> 17.1812, <5> 40.0071, <6> 19.3296, <7> 22.7787, <8> 38.5649, <9> 24.3181, <10> 41.1859;
param workload[JOB] := <1> 1906.9204, <2> 1310.9686, <3> 562.1736, <4> 295.1936, <5> 1600.5681, <6> 373.6334, <7> 518.8692, <8> 1487.2515, <9> 591.37, <10> 1696.2784;
param capacity[MACHINE] := <1> 10343.2268, <2> 10343.2268, <3> 10343.2268;

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
