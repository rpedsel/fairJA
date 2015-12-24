set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7716, <2> 34.0099, <3> 47.1299, <4> 17.803, <5> 1.2052, <6> 30.3007, <7> 29.6839, <8> 22.1924, <9> 10.827, <10> 24.8243, <11> 41.812, <12> 44.2282, <13> 13.8942, <14> 29.1524, <15> 12.0182, <16> 3.2374, <17> 13.4419, <18> 44.6217, <19> 45.6344, <20> 20.8022;
param workload[JOB] := <1> 28.1108, <2> 21.2699, <3> 32.47, <4> 26.8496, <5> 3.1517, <6> 9.5602, <7> 26.5545, <8> 3.4229, <9> 5.9036, <10> 12.2816, <11> 33.1352, <12> 27.1693, <13> 14.5968, <14> 24.0036, <15> 6.1391, <16> 3.2657, <17> 22.5067, <18> 0.611, <19> 38.7325, <20> 16.7725;
param capacity[MACHINE] := <1> 51.1359, <2> 51.1359, <3> 51.1359, <4> 51.1359, <5> 51.1359, <6> 51.1359, <7> 51.1359;

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
