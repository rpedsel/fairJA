set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.9888, <2> 41.8899, <3> 26.4634, <4> 27.3118, <5> 25.7058, <6> 29.8366, <7> 22.3763, <8> 42.5635, <9> 17.2485, <10> 22.9059, <11> 10.4082, <12> 36.5235, <13> 37.6052, <14> 47.3239, <15> 28.2814, <16> 44.7226, <17> 26.4617, <18> 46.5363, <19> 11.8627, <20> 23.9207;
param workload[JOB] := <1> 39.6383, <2> 0.674, <3> 41.641, <4> 41.4637, <5> 6.1777, <6> 47.7491, <7> 26.5057, <8> 15.9051, <9> 26.2117, <10> 32.2253, <11> 36.8435, <12> 43.265, <13> 8.4852, <14> 30.0621, <15> 6.542, <16> 14.0182, <17> 15.991, <18> 26.3954, <19> 42.4401, <20> 8.0024;
param capacity[MACHINE] := <1> 63.7796, <2> 63.7796, <3> 63.7796, <4> 63.7796, <5> 63.7796, <6> 63.7796;

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
