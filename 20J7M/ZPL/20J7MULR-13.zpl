set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.3484, <2> 3.3148, <3> 5.7578, <4> 11.1858, <5> 42.419, <6> 5.6403, <7> 46.7971, <8> 29.1847, <9> 13.0665, <10> 11.9589, <11> 30.8618, <12> 6.9924, <13> 8.598, <14> 4.2408, <15> 31.098, <16> 31.9898, <17> 39.0543, <18> 25.7696, <19> 27.2763, <20> 31.2335;
param workload[JOB] := <1> 8.3544, <2> 21.3144, <3> 41.6596, <4> 40.7933, <5> 11.7333, <6> 23.5919, <7> 12.7757, <8> 12.3196, <9> 17.9333, <10> 37.3133, <11> 47.9549, <12> 49.6482, <13> 46.0553, <14> 3.5482, <15> 44.1673, <16> 41.0207, <17> 31.405, <18> 28.4191, <19> 3.5196, <20> 31.2157;
param capacity[MACHINE] := <1> 79.249, <2> 79.249, <3> 79.249, <4> 79.249, <5> 79.249, <6> 79.249, <7> 79.249;

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
