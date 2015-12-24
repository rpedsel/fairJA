set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.3967, <2> 43.6182, <3> 33.7185, <4> 43.5155, <5> 39.3666, <6> 10.3699, <7> 41.0495, <8> 30.5202, <9> 7.3245, <10> 40.2373;
param workload[JOB] := <1> 11.3313, <2> 35.3992, <3> 36.8767, <4> 34.1721, <5> 32.0249, <6> 39.9371, <7> 32.5038, <8> 24.8217, <9> 16.2348, <10> 14.9023;
param capacity[MACHINE] := <1> 92.7346, <2> 92.7346, <3> 92.7346;

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
