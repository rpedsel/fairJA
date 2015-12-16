set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.9806, <2> 18.6028, <3> 34.7925, <4> 46.1933, <5> 15.4269, <6> 23.5093, <7> 27.5576, <8> 8.922, <9> 6.1282, <10> 13.482, <11> 47.3239, <12> 42.772, <13> 33.5725, <14> 16.7226, <15> 17.4147, <16> 34.8841, <17> 45.7443, <18> 7.9762, <19> 31.0831, <20> 13.6044;
param workload[JOB] := <1> 38.9806, <2> 18.6028, <3> 34.7925, <4> 46.1933, <5> 15.4269, <6> 23.5093, <7> 27.5576, <8> 8.922, <9> 6.1282, <10> 13.482, <11> 47.3239, <12> 42.772, <13> 33.5725, <14> 16.7226, <15> 17.4147, <16> 34.8841, <17> 45.7443, <18> 7.9762, <19> 31.0831, <20> 13.6044;
param capacity[MACHINE] := <1> 524.693, <2> 524.693, <3> 524.693, <4> 524.693, <5> 524.693, <6> 524.693;

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
