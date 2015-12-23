set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.913, <2> 8.638, <3> 20.3781, <4> 20.8259, <5> 29.2716, <6> 41.3446, <7> 40.3127, <8> 35.4083, <9> 36.5785, <10> 2.0376, <11> 41.8899, <12> 23.3216, <13> 42.8899, <14> 45.8762, <15> 25.319, <16> 0.9955, <17> 31.435, <18> 29.8516, <19> 30.99, <20> 43.4423;
param workload[JOB] := <1> 36.3401, <2> 37.4038, <3> 27.4889, <4> 40.8214, <5> 14.7403, <6> 29.7303, <7> 19.9445, <8> 48.9346, <9> 46.5555, <10> 23.893, <11> 0.246, <12> 0.6992, <13> 29.4078, <14> 12.5592, <15> 20.3226, <16> 21.2671, <17> 12.9894, <18> 11.9824, <19> 21.1153, <20> 48.375;
param capacity[MACHINE] := <1> 72.1166, <2> 72.1166, <3> 72.1166, <4> 72.1166, <5> 72.1166, <6> 72.1166, <7> 72.1166;

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
