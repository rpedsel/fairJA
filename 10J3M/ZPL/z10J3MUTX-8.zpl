set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2167, <2> 39.625, <3> 17.9506, <4> 20.6026, <5> 10.0465, <6> 41.617, <7> 44.385, <8> 46.0629, <9> 42.0262, <10> 28.1923;
param workload[JOB] := <1> 4.6062, <2> 6.2948, <3> 4.2368, <4> 4.539, <5> 3.1696, <6> 6.4511, <7> 6.6622, <8> 6.787, <9> 6.4828, <10> 5.3096;
param capacity[MACHINE] := <1> 13.6348, <2> 13.6348, <3> 13.6348;

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
