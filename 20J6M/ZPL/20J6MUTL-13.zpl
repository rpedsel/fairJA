set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.2304, <2> 10.2958, <3> 32.4084, <4> 15.4572, <5> 10.6355, <6> 33.358, <7> 43.5019, <8> 39.7972, <9> 26.4065, <10> 33.4813, <11> 47.777, <12> 13.8408, <13> 2.5631, <14> 48.9963, <15> 38.265, <16> 17.7937, <17> 1.3544, <18> 2.3958, <19> 44.3159, <20> 41.5712;
param workload[JOB] := <1> 34.2304, <2> 10.2958, <3> 32.4084, <4> 15.4572, <5> 10.6355, <6> 33.358, <7> 43.5019, <8> 39.7972, <9> 26.4065, <10> 33.4813, <11> 47.777, <12> 13.8408, <13> 2.5631, <14> 48.9963, <15> 38.265, <16> 17.7937, <17> 1.3544, <18> 2.3958, <19> 44.3159, <20> 41.5712;
param capacity[MACHINE] := <1> 67.3057, <2> 67.3057, <3> 67.3057, <4> 67.3057, <5> 67.3057, <6> 67.3057;

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
