set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2823, <2> 21.9694, <3> 28.7297, <4> 25.7043, <5> 26.1014, <6> 28.2017, <7> 25.058, <8> 18.6353, <9> 26.0221, <10> 22.6171;
param workload[JOB] := <1> 496.5009, <2> 482.6545, <3> 825.3957, <4> 660.711, <5> 681.2831, <6> 795.3359, <7> 627.9034, <8> 347.2744, <9> 677.1497, <10> 511.5332;
param capacity[MACHINE] := <1> 6105.7418, <2> 6105.7418, <3> 6105.7418;

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
