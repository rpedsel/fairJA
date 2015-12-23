set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.0706, <2> 45.023, <3> 5.1072, <4> 41.5454, <5> 1.5218, <6> 48.5362, <7> 34.5555, <8> 36.6457, <9> 27.9657, <10> 38.3329, <11> 24.733, <12> 34.904, <13> 45.0099, <14> 19.1887, <15> 37.66, <16> 11.1458, <17> 7.4516, <18> 1.5675, <19> 4.8034, <20> 49.7334;
param workload[JOB] := <1> 5.0706, <2> 45.023, <3> 5.1072, <4> 41.5454, <5> 1.5218, <6> 48.5362, <7> 34.5555, <8> 36.6457, <9> 27.9657, <10> 38.3329, <11> 24.733, <12> 34.904, <13> 45.0099, <14> 19.1887, <15> 37.66, <16> 11.1458, <17> 7.4516, <18> 1.5675, <19> 4.8034, <20> 49.7334;
param capacity[MACHINE] := <1> 55.768, <2> 55.768, <3> 55.768, <4> 55.768, <5> 55.768, <6> 55.768, <7> 55.768;

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
