set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.2919, <2> 15.1278, <3> 41.5972, <4> 40.0646, <5> 25.3942, <6> 16.779, <7> 33.3277, <8> 2.8745, <9> 35.4374, <10> 34.8031;
param workload[JOB] := <1> 28.0042, <2> 228.8503, <3> 1730.327, <4> 1605.1722, <5> 644.8654, <6> 281.5348, <7> 1110.7356, <8> 8.2628, <9> 1255.8093, <10> 1211.2558;
param capacity[MACHINE] := <1> 2701.6058, <2> 2701.6058, <3> 2701.6058;

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
