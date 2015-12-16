set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.8773, <2> 32.088, <3> 19.2681, <4> 22.127, <5> 24.6964, <6> 31.4415, <7> 26.4057, <8> 19.7668, <9> 27.1418, <10> 30.9589;
param workload[JOB] := <1> 20.8773, <2> 32.088, <3> 19.2681, <4> 22.127, <5> 24.6964, <6> 31.4415, <7> 26.4057, <8> 19.7668, <9> 27.1418, <10> 30.9589;
param capacity[MACHINE] := <1> 254.7715, <2> 254.7715, <3> 254.7715;

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
