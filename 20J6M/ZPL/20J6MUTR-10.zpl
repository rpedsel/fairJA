set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.6765, <2> 16.9368, <3> 31.5948, <4> 0.3897, <5> 40.4685, <6> 28.8438, <7> 9.9773, <8> 43.1922, <9> 47.4004, <10> 33.9255, <11> 43.0731, <12> 42.1055, <13> 49.0822, <14> 41.4827, <15> 45.6716, <16> 40.0358, <17> 25.9477, <18> 31.2596, <19> 46.7609, <20> 37.9588;
param workload[JOB] := <1> 35.119, <2> 32.7823, <3> 30.5178, <4> 12.6848, <5> 33.2452, <6> 31.9472, <7> 2.8053, <8> 49.4364, <9> 35.874, <10> 36.3073, <11> 38.9167, <12> 32.3987, <13> 39.2912, <14> 37.1922, <15> 7.0282, <16> 36.5199, <17> 36.4729, <18> 17.3609, <19> 28.7112, <20> 42.2765;
param capacity[MACHINE] := <1> 77.111, <2> 77.111, <3> 77.111, <4> 77.111, <5> 77.111, <6> 77.111;

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
