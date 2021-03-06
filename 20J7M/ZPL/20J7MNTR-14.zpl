set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.9277, <2> 27.5838, <3> 32.0487, <4> 31.2139, <5> 23.2974, <6> 25.2248, <7> 22.3346, <8> 28.4897, <9> 26.2605, <10> 25.0624, <11> 22.5582, <12> 29.3476, <13> 28.096, <14> 20.8148, <15> 24.8205, <16> 29.263, <17> 24.0939, <18> 32.4181, <19> 27.6942, <20> 27.0586;
param workload[JOB] := <1> 10.7665, <2> 45.2952, <3> 28.9871, <4> 37.2278, <5> 46.5908, <6> 26.3836, <7> 8.8299, <8> 2.9312, <9> 0.1094, <10> 2.2785, <11> 5.3292, <12> 33.3682, <13> 11.5804, <14> 3.5215, <15> 24.7733, <16> 23.1991, <17> 18.1919, <18> 12.1268, <19> 18.0471, <20> 9.7171;
param capacity[MACHINE] := <1> 61.5608, <2> 61.5608, <3> 61.5608, <4> 61.5608, <5> 61.5608, <6> 61.5608, <7> 61.5608;

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
