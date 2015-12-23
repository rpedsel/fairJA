set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.5508, <2> 23.2483, <3> 15.1244, <4> 32.2397, <5> 11.6864, <6> 29.8259, <7> 23.3994, <8> 13.9351, <9> 4.2154, <10> 48.8698, <11> 15.8658, <12> 0.4802, <13> 6.9375, <14> 8.5851, <15> 6.8465, <16> 3.7848, <17> 15.1057, <18> 21.4619, <19> 43.011, <20> 27.9982;
param workload[JOB] := <1> 4.8529, <2> 4.8216, <3> 3.889, <4> 5.678, <5> 3.4185, <6> 5.4613, <7> 4.8373, <8> 3.733, <9> 2.0531, <10> 6.9907, <11> 3.9832, <12> 0.693, <13> 2.6339, <14> 2.93, <15> 2.6166, <16> 1.9455, <17> 3.8866, <18> 4.6327, <19> 6.5583, <20> 5.2913;
param capacity[MACHINE] := <1> 80.9065, <2> 80.9065, <3> 80.9065, <4> 80.9065, <5> 80.9065, <6> 80.9065, <7> 80.9065;

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
