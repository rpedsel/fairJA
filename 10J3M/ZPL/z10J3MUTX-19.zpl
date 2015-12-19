set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.4975, <2> 0.429, <3> 49.0454, <4> 17.1226, <5> 4.3838, <6> 46.0788, <7> 2.3006, <8> 17.5669, <9> 41.232, <10> 17.2733;
param workload[JOB] := <1> 5.7877, <2> 0.655, <3> 7.0032, <4> 4.1379, <5> 2.0938, <6> 6.7881, <7> 1.5168, <8> 4.1913, <9> 6.4212, <10> 4.1561;
param capacity[MACHINE] := <1> 10.6878, <2> 10.6878, <3> 10.6878;

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
