set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.604, <2> 35.5257, <3> 15.5771, <4> 16.8032, <5> 11.2696, <6> 29.5775, <7> 25.2197, <8> 48.5274, <9> 1.524, <10> 21.3485, <11> 31.8783, <12> 26.4117, <13> 38.349, <14> 37.2903, <15> 25.7054, <16> 0.4183, <17> 35.4187, <18> 32.5311, <19> 34.3674, <20> 38.9967;
param workload[JOB] := <1> 818.1888, <2> 1262.0754, <3> 242.646, <4> 282.3475, <5> 127.0039, <6> 874.8285, <7> 636.0333, <8> 2354.9086, <9> 2.3226, <10> 455.7585, <11> 1016.226, <12> 697.5779, <13> 1470.6458, <14> 1390.5665, <15> 660.7676, <16> 0.175, <17> 1254.4843, <18> 1058.2725, <19> 1181.1182, <20> 1520.7426;
param capacity[MACHINE] := <1> 1854.2881, <2> 1854.2881, <3> 1854.2881, <4> 1854.2881, <5> 1854.2881, <6> 1854.2881, <7> 1854.2881;

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
