set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.2632, <2> 31.3487, <3> 30.7062, <4> 4.3955, <5> 16.5193, <6> 35.2696, <7> 37.5476, <8> 0.2935, <9> 41.2589, <10> 41.629;
param workload[JOB] := <1> 1541.5989, <2> 982.741, <3> 942.8707, <4> 19.3204, <5> 272.8873, <6> 1243.9447, <7> 1409.8223, <8> 0.0861, <9> 1702.2968, <10> 1732.9736;
param capacity[MACHINE] := <1> 3282.8473, <2> 3282.8473, <3> 3282.8473;

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
