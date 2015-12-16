set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.7438, <2> 3.422, <3> 2.2047, <4> 25.2054, <5> 15.0098, <6> 16.8797, <7> 23.0822, <8> 13.1792, <9> 12.7739, <10> 11.1723;
param workload[JOB] := <1> 16.701, <2> 41.5163, <3> 41.0644, <4> 12.5062, <5> 2.5876, <6> 37.8724, <7> 2.9135, <8> 38.5431, <9> 17.0495, <10> 41.7066;
param capacity[MACHINE] := <1> 252.4606, <2> 252.4606, <3> 252.4606;

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
