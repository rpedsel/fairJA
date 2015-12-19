set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.2823, <2> 29.8621, <3> 23.2572, <4> 43.3894, <5> 28.5365, <6> 6.0302, <7> 35.0863, <8> 12.0862, <9> 38.2061, <10> 49.3248;
param workload[JOB] := <1> 28.6725, <2> 47.4696, <3> 30.5778, <4> 21.3779, <5> 4.3492, <6> 43.959, <7> 27.8418, <8> 20.5541, <9> 6.7401, <10> 44.5527;
param capacity[MACHINE] := <1> 92.0316, <2> 92.0316, <3> 92.0316;

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
