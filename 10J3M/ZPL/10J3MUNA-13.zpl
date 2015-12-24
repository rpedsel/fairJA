set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.4277, <2> 36.1183, <3> 48.6002, <4> 39.4748, <5> 27.662, <6> 48.68, <7> 0.5227, <8> 33.4733, <9> 43.4887, <10> 29.3727;
param workload[JOB] := <1> 1185.2665, <2> 1304.5316, <3> 2361.9794, <4> 1558.2598, <5> 765.1862, <6> 2369.7424, <7> 0.2732, <8> 1120.4618, <9> 1891.267, <10> 862.7555;
param capacity[MACHINE] := <1> 13419.7234, <2> 13419.7234, <3> 13419.7234;

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
