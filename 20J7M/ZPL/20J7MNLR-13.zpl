set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.829, <2> 29.2922, <3> 33.5354, <4> 28.5067, <5> 28.8041, <6> 23.1749, <7> 23.7217, <8> 27.2178, <9> 26.6022, <10> 26.0153, <11> 27.6898, <12> 26.1868, <13> 25.749, <14> 24.5352, <15> 23.4618, <16> 31.4137, <17> 22.3653, <18> 21.531, <19> 26.1721, <20> 21.8198;
param workload[JOB] := <1> 35.9333, <2> 18.6795, <3> 26.8993, <4> 2.6768, <5> 22.6067, <6> 49.9224, <7> 37.5304, <8> 36.9022, <9> 44.8258, <10> 9.9873, <11> 44.0569, <12> 31.3876, <13> 31.19, <14> 7.0546, <15> 19.7251, <16> 21.8868, <17> 4.0196, <18> 9.5335, <19> 13.8265, <20> 15.7161;
param capacity[MACHINE] := <1> 69.1943, <2> 69.1943, <3> 69.1943, <4> 69.1943, <5> 69.1943, <6> 69.1943, <7> 69.1943;

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
