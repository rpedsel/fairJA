set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.7093, <2> 11.5725, <3> 35.5699, <4> 12.6227, <5> 47.9579, <6> 37.7437, <7> 8.5783, <8> 37.6853, <9> 22.9398, <10> 48.5871, <11> 48.9185, <12> 30.2739, <13> 23.7853, <14> 41.5758, <15> 15.5097, <16> 4.7295, <17> 33.2474, <18> 16.6124, <19> 25.3223, <20> 24.7372;
param workload[JOB] := <1> 5.9517, <2> 18.7342, <3> 31.9517, <4> 19.4364, <5> 25.0431, <6> 2.698, <7> 47.5885, <8> 8.7445, <9> 17.2508, <10> 14.7, <11> 10.9229, <12> 23.5373, <13> 4.5122, <14> 29.5781, <15> 8.1826, <16> 37.7921, <17> 49.7243, <18> 13.7351, <19> 0.9198, <20> 25.9275;
param capacity[MACHINE] := <1> 396.9308, <2> 396.9308, <3> 396.9308, <4> 396.9308, <5> 396.9308, <6> 396.9308;

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
