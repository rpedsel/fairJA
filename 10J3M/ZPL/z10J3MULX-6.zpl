set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.4646, <2> 0.5555, <3> 40.0385, <4> 4.6468, <5> 23.4899, <6> 45.7277, <7> 4.4577, <8> 21.1027, <9> 3.9827, <10> 16.7877;
param workload[JOB] := <1> 6.5165, <2> 0.7453, <3> 6.3276, <4> 2.1556, <5> 4.8466, <6> 6.7622, <7> 2.1113, <8> 4.5938, <9> 1.9957, <10> 4.0973;
param capacity[MACHINE] := <1> 13.384, <2> 13.384, <3> 13.384;

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
