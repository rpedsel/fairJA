set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.1884, <2> 32.1683, <3> 41.6624, <4> 34.4599, <5> 16.5361, <6> 15.9573, <7> 18.0042, <8> 39.2694, <9> 48.4926, <10> 12.4786;
param workload[JOB] := <1> 1036.0931, <2> 1034.7995, <3> 1735.7556, <4> 1187.4847, <5> 273.4426, <6> 254.6354, <7> 324.1512, <8> 1542.0858, <9> 2351.5323, <10> 155.7155;
param capacity[MACHINE] := <1> 9895.6957, <2> 9895.6957, <3> 9895.6957;

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
