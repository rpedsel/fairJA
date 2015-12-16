set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.9572, <2> 6.7923, <3> 40.1905, <4> 9.9288, <5> 48.6014, <6> 13.5915, <7> 1.443, <8> 27.7763, <9> 11.5958, <10> 36.575;
param workload[JOB] := <1> 4.8946, <2> 2.6062, <3> 6.3396, <4> 3.151, <5> 6.9715, <6> 3.6867, <7> 1.2012, <8> 5.2703, <9> 3.4053, <10> 6.0477;
param capacity[MACHINE] := <1> 14.5247, <2> 14.5247, <3> 14.5247;

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
