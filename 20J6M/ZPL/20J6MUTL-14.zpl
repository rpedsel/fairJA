set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7427, <2> 15.2454, <3> 27.0024, <4> 39.7578, <5> 47.1394, <6> 7.9968, <7> 4.8182, <8> 41.5569, <9> 29.7171, <10> 32.9308, <11> 14.9981, <12> 12.2362, <13> 19.6122, <14> 7.747, <15> 10.2406, <16> 9.0952, <17> 9.41, <18> 43.8011, <19> 7.0993, <20> 32.6492;
param workload[JOB] := <1> 30.7427, <2> 15.2454, <3> 27.0024, <4> 39.7578, <5> 47.1394, <6> 7.9968, <7> 4.8182, <8> 41.5569, <9> 29.7171, <10> 32.9308, <11> 14.9981, <12> 12.2362, <13> 19.6122, <14> 7.747, <15> 10.2406, <16> 9.0952, <17> 9.41, <18> 43.8011, <19> 7.0993, <20> 32.6492;
param capacity[MACHINE] := <1> 55.4746, <2> 55.4746, <3> 55.4746, <4> 55.4746, <5> 55.4746, <6> 55.4746;

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
