set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.2388, <2> 38.8568, <3> 0.2348, <4> 33.6138, <5> 37.1333, <6> 8.039, <7> 10.6121, <8> 41.5562, <9> 23.0126, <10> 5.6244;
param workload[JOB] := <1> 370.1314, <2> 1509.8509, <3> 0.0551, <4> 1129.8876, <5> 1378.882, <6> 64.6255, <7> 112.6167, <8> 1726.9178, <9> 529.5798, <10> 31.6339;
param capacity[MACHINE] := <1> 2284.7269, <2> 2284.7269, <3> 2284.7269;

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
