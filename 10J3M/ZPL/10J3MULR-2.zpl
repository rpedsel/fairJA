set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.6013, <2> 33.5981, <3> 0.3043, <4> 9.9172, <5> 21.1268, <6> 19.0983, <7> 33.4831, <8> 40.2088, <9> 32.269, <10> 40.2811;
param workload[JOB] := <1> 16.5264, <2> 37.8076, <3> 36.7182, <4> 46.6324, <5> 22.7133, <6> 48.8781, <7> 23.1751, <8> 1.8657, <9> 20.3093, <10> 34.3588;
param capacity[MACHINE] := <1> 96.3283, <2> 96.3283, <3> 96.3283;

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
