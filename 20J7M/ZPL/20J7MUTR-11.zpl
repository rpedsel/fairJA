set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.3105, <2> 18.3117, <3> 5.7975, <4> 28.6356, <5> 38.2227, <6> 4.8741, <7> 10.981, <8> 42.5096, <9> 35.3514, <10> 5.8044, <11> 34.8187, <12> 43.3049, <13> 31.6766, <14> 31.9945, <15> 12.644, <16> 28.0992, <17> 27.078, <18> 1.0172, <19> 16.8092, <20> 0.8041;
param workload[JOB] := <1> 34.0929, <2> 9.581, <3> 26.099, <4> 20.6807, <5> 34.1072, <6> 30.8625, <7> 28.3192, <8> 3.9491, <9> 23.9139, <10> 24.5711, <11> 35.6601, <12> 21.3479, <13> 31.5834, <14> 12.014, <15> 12.7674, <16> 2.6993, <17> 35.8746, <18> 23.3149, <19> 12.1858, <20> 18.5623;
param capacity[MACHINE] := <1> 47.3771, <2> 47.3771, <3> 47.3771, <4> 47.3771, <5> 47.3771, <6> 47.3771, <7> 47.3771;

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
