set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.0948, <2> 26.2198, <3> 29.418, <4> 20.0587, <5> 10.3105, <6> 28.5202, <7> 25.2537, <8> 16.3457, <9> 23.9222, <10> 28.0717;
param workload[JOB] := <1> 403.801, <2> 687.4779, <3> 865.4187, <4> 402.3514, <5> 106.3064, <6> 813.4018, <7> 637.7494, <8> 267.1819, <9> 572.2717, <10> 788.0203;
param capacity[MACHINE] := <1> 1847.9935, <2> 1847.9935, <3> 1847.9935;

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
