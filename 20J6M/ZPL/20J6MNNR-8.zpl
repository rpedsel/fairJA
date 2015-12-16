set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.7325, <2> 36.5089, <3> 21.4209, <4> 28.8943, <5> 29.4328, <6> 23.555, <7> 23.4944, <8> 33.0205, <9> 30.8151, <10> 31.5649, <11> 29.3485, <12> 30.6717, <13> 28.7198, <14> 29.6426, <15> 23.4001, <16> 25.0794, <17> 28.7446, <18> 16.9925, <19> 23.7505, <20> 25.3219;
param workload[JOB] := <1> 1.9716, <2> 37.4488, <3> 25.9575, <4> 36.8975, <5> 33.5728, <6> 42.0953, <7> 29.4104, <8> 6.4477, <9> 35.0727, <10> 22.598, <11> 28.9818, <12> 44.903, <13> 14.5129, <14> 32.7698, <15> 1.6668, <16> 49.6783, <17> 8.0077, <18> 44.1928, <19> 23.1183, <20> 0.7262;
param capacity[MACHINE] := <1> 520.0299, <2> 520.0299, <3> 520.0299, <4> 520.0299, <5> 520.0299, <6> 520.0299;

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
