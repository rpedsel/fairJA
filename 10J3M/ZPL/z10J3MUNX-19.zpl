set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.0867, <2> 7.1748, <3> 40.4956, <4> 8.8884, <5> 1.2766, <6> 7.6126, <7> 2.3058, <8> 9.3748, <9> 43.3718, <10> 34.7298;
param workload[JOB] := <1> 7.0062, <2> 2.6786, <3> 6.3636, <4> 2.9813, <5> 1.1299, <6> 2.7591, <7> 1.5185, <8> 3.0618, <9> 6.5857, <10> 5.8932;
param capacity[MACHINE] := <1> 39.9779, <2> 39.9779, <3> 39.9779;

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
