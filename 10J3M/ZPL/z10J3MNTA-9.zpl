set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.4903, <2> 28.0447, <3> 23.7695, <4> 13.0356, <5> 23.338, <6> 32.0351, <7> 27.9359, <8> 19.5056, <9> 19.5688, <10> 24.1401;
param workload[JOB] := <1> 1055.6196, <2> 786.5052, <3> 564.9891, <4> 169.9269, <5> 544.6622, <6> 1026.2476, <7> 780.4145, <8> 380.4684, <9> 382.9379, <10> 582.7444;
param capacity[MACHINE] := <1> 1568.629, <2> 1568.629, <3> 1568.629;

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
