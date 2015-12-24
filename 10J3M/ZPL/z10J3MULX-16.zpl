set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.8674, <2> 12.7218, <3> 49.6454, <4> 45.9182, <5> 41.9238, <6> 8.1211, <7> 10.3067, <8> 10.9031, <9> 27.398, <10> 26.0655;
param workload[JOB] := <1> 4.107, <2> 3.5668, <3> 7.0459, <4> 6.7763, <5> 6.4749, <6> 2.8498, <7> 3.2104, <8> 3.302, <9> 5.2343, <10> 5.1054;
param capacity[MACHINE] := <1> 15.8909, <2> 15.8909, <3> 15.8909;

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
