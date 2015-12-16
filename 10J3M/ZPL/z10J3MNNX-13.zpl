set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.7819, <2> 19.6765, <3> 17.0346, <4> 23.2354, <5> 28.0683, <6> 17.4355, <7> 36.9554, <8> 20.8101, <9> 26.9646, <10> 35.2225;
param workload[JOB] := <1> 5.3649, <2> 4.4358, <3> 4.1273, <4> 4.8203, <5> 5.298, <6> 4.1756, <7> 6.0791, <8> 4.5618, <9> 5.1927, <10> 5.9349;
param capacity[MACHINE] := <1> 49.9904, <2> 49.9904, <3> 49.9904;

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
