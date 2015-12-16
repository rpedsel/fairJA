set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 48.1679, <2> 23.7135, <3> 13.4936, <4> 8.4725, <5> 41.5368, <6> 26.1247, <7> 39.4119, <8> 28.6705, <9> 33.8689, <10> 20.4398, <11> 27.6825, <12> 38.6611, <13> 44.5221, <14> 4.584, <15> 9.9349, <16> 16.3594, <17> 6.0251, <18> 7.4483, <19> 43.2395, <20> 35.03;
param workload[JOB] := <1> 40.973, <2> 11.0498, <3> 39.3218, <4> 14.441, <5> 20.2953, <6> 19.9155, <7> 48.848, <8> 36.8866, <9> 39.5618, <10> 47.4917, <11> 42.7627, <12> 37.3767, <13> 38.7189, <14> 6.1998, <15> 13.5333, <16> 33.562, <17> 30.5204, <18> 8.1822, <19> 25.1457, <20> 40.6125;
param capacity[MACHINE] := <1> 99.2331, <2> 99.2331, <3> 99.2331, <4> 99.2331, <5> 99.2331, <6> 99.2331;

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
