set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.4219, <2> 8.5789, <3> 5.3409, <4> 4.1662, <5> 16.4949, <6> 32.5103, <7> 21.2932, <8> 45.2052, <9> 44.1337, <10> 25.3659;
param workload[JOB] := <1> 2154.9928, <2> 73.5975, <3> 28.5252, <4> 17.3572, <5> 272.0817, <6> 1056.9196, <7> 453.4004, <8> 2043.5101, <9> 1947.7835, <10> 643.4289;
param capacity[MACHINE] := <1> 8691.5969, <2> 8691.5969, <3> 8691.5969;

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
