set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.5584, <2> 19.9953, <3> 19.8265, <4> 25.8637, <5> 29.8757, <6> 19.196, <7> 26.2194, <8> 25.8341, <9> 21.6995, <10> 21.2496, <11> 24.419, <12> 26.3254, <13> 26.6134, <14> 25.1233, <15> 33.058, <16> 23.351, <17> 27.1507, <18> 13.9925, <19> 26.3502, <20> 31.8316;
param workload[JOB] := <1> 4.7496, <2> 4.4716, <3> 4.4527, <4> 5.0856, <5> 5.4659, <6> 4.3813, <7> 5.1205, <8> 5.0827, <9> 4.6583, <10> 4.6097, <11> 4.9416, <12> 5.1308, <13> 5.1588, <14> 5.0123, <15> 5.7496, <16> 4.8323, <17> 5.2106, <18> 3.7407, <19> 5.1332, <20> 5.642;
param capacity[MACHINE] := <1> 98.6298, <2> 98.6298, <3> 98.6298, <4> 98.6298, <5> 98.6298, <6> 98.6298, <7> 98.6298;

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
