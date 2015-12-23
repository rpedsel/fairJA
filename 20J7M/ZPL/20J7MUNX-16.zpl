set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.7578, <2> 44.7279, <3> 27.2794, <4> 33.7285, <5> 47.8141, <6> 37.9658, <7> 23.8897, <8> 27.9083, <9> 16.2332, <10> 25.3397, <11> 24.9415, <12> 22.1913, <13> 33.4026, <14> 46.0682, <15> 29.0125, <16> 36.856, <17> 27.2919, <18> 35.6942, <19> 37.4979, <20> 18.6964;
param workload[JOB] := <1> 2.9594, <2> 6.6879, <3> 5.223, <4> 5.8076, <5> 6.9148, <6> 6.1616, <7> 4.8877, <8> 5.2828, <9> 4.029, <10> 5.0339, <11> 4.9941, <12> 4.7108, <13> 5.7795, <14> 6.7874, <15> 5.3863, <16> 6.0709, <17> 5.2242, <18> 5.9745, <19> 6.1236, <20> 4.3239;
param capacity[MACHINE] := <1> 108.3629, <2> 108.3629, <3> 108.3629, <4> 108.3629, <5> 108.3629, <6> 108.3629, <7> 108.3629;

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
