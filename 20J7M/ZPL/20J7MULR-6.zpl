set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.1405, <2> 21.0012, <3> 14.3064, <4> 49.0312, <5> 29.7053, <6> 37.6252, <7> 14.5227, <8> 47.2478, <9> 40.1508, <10> 24.0377, <11> 30.5013, <12> 49.8668, <13> 24.2964, <14> 5.3533, <15> 37.9323, <16> 39.9208, <17> 33.4563, <18> 44.0926, <19> 41.473, <20> 11.9372;
param workload[JOB] := <1> 15.5604, <2> 0.5404, <3> 3.6894, <4> 35.5163, <5> 16.7677, <6> 9.7125, <7> 0.7522, <8> 12.8714, <9> 28.2771, <10> 46.7478, <11> 49.0261, <12> 3.5818, <13> 16.1481, <14> 2.774, <15> 0.234, <16> 16.7809, <17> 15.9075, <18> 26.9421, <19> 48.3268, <20> 23.8335;
param capacity[MACHINE] := <1> 53.4271, <2> 53.4271, <3> 53.4271, <4> 53.4271, <5> 53.4271, <6> 53.4271, <7> 53.4271;

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
