set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.851, <2> 32.0146, <3> 33.4918, <4> 22.2739, <5> 25.2832, <6> 3.105, <7> 43.9767, <8> 0.3155, <9> 6.7942, <10> 5.6847;
param workload[JOB] := <1> 1432.6982, <2> 1024.9346, <3> 1121.7007, <4> 496.1266, <5> 639.2402, <6> 9.641, <7> 1933.9501, <8> 0.0995, <9> 46.1612, <10> 32.3158;
param capacity[MACHINE] := <1> 2903.8096, <2> 2903.8096, <3> 2903.8096;

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
