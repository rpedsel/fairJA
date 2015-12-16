set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.967, <2> 16.9202, <3> 48.1653, <4> 0.9936, <5> 25.8594, <6> 9.1825, <7> 26.1139, <8> 38.6335, <9> 33.3889, <10> 31.7075;
param workload[JOB] := <1> 6.6308, <2> 4.1134, <3> 6.9401, <4> 0.9968, <5> 5.0852, <6> 3.0303, <7> 5.1102, <8> 6.2156, <9> 5.7783, <10> 5.6309;
param capacity[MACHINE] := <1> 49.5316, <2> 49.5316, <3> 49.5316;

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
