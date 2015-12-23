set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.9511, <2> 19.4804, <3> 26.45, <4> 29.9479, <5> 19.7893, <6> 28.7899, <7> 21.7549, <8> 24.6165, <9> 17.1482, <10> 14.842, <11> 25.1714, <12> 29.2558, <13> 15.1441, <14> 22.1679, <15> 25.5831, <16> 27.1077, <17> 24.2204, <18> 35.5225, <19> 23.6208, <20> 26.672;
param workload[JOB] := <1> 48.1977, <2> 43.1918, <3> 2.0009, <4> 6.7712, <5> 23.4153, <6> 25.5899, <7> 12.3655, <8> 20.193, <9> 41.6066, <10> 15.6077, <11> 46.1344, <12> 35.2093, <13> 44.9226, <14> 12.8716, <15> 43.915, <16> 2.6316, <17> 34.5862, <18> 22.3549, <19> 2.5952, <20> 29.5932;
param capacity[MACHINE] := <1> 513.7536, <2> 513.7536, <3> 513.7536, <4> 513.7536, <5> 513.7536, <6> 513.7536, <7> 513.7536;

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
