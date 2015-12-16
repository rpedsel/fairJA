set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.533, <2> 5.8602, <3> 17.3938, <4> 33.3622, <5> 47.0501, <6> 16.6585, <7> 15.7928, <8> 32.2017, <9> 19.6757, <10> 2.8709;
param workload[JOB] := <1> 37.1776, <2> 44.0785, <3> 29.4495, <4> 0.8544, <5> 11.7331, <6> 49.129, <7> 38.1304, <8> 43.2082, <9> 9.3726, <10> 40.278;
param capacity[MACHINE] := <1> 303.4113, <2> 303.4113, <3> 303.4113;

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
