set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8258, <2> 24.9342, <3> 26.7658, <4> 11.6141, <5> 31.6738, <6> 38.4951, <7> 21.9571, <8> 31.8933, <9> 30.7252, <10> 27.2768;
param workload[JOB] := <1> 616.3203, <2> 621.7143, <3> 716.408, <4> 134.8873, <5> 1003.2296, <6> 1481.8727, <7> 482.1142, <8> 1017.1826, <9> 944.0379, <10> 744.0238;
param capacity[MACHINE] := <1> 1940.4477, <2> 1940.4477, <3> 1940.4477;

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
