set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.174, <2> 19.8375, <3> 16.9229, <4> 7.5897, <5> 36.3815, <6> 22.1752, <7> 22.9401, <8> 32.8352, <9> 46.4099, <10> 10.3955;
param workload[JOB] := <1> 851.1223, <2> 393.5264, <3> 286.3845, <4> 57.6035, <5> 1323.6135, <6> 491.7395, <7> 526.2482, <8> 1078.1504, <9> 2153.8788, <10> 108.0664;
param capacity[MACHINE] := <1> 7270.3335, <2> 7270.3335, <3> 7270.3335;

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
