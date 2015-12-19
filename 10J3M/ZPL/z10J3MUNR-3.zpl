set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.3398, <2> 49.3566, <3> 4.2819, <4> 30.3924, <5> 32.3771, <6> 37.1315, <7> 22.2054, <8> 45.5776, <9> 42.4323, <10> 5.1485;
param workload[JOB] := <1> 9.3971, <2> 30.9368, <3> 13.2931, <4> 41.6196, <5> 11.7112, <6> 4.4793, <7> 12.6589, <8> 37.0066, <9> 35.0632, <10> 8.0364;
param capacity[MACHINE] := <1> 204.2022, <2> 204.2022, <3> 204.2022;

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
