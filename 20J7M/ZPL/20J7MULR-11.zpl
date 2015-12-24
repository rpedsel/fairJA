set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.893, <2> 49.6442, <3> 28.7454, <4> 44.2758, <5> 44.8239, <6> 2.2353, <7> 12.6964, <8> 34.128, <9> 2.6827, <10> 20.2536, <11> 17.5749, <12> 31.3956, <13> 18.3755, <14> 8.7982, <15> 4.1218, <16> 21.983, <17> 34.055, <18> 6.9746, <19> 45.6562, <20> 20.0121;
param workload[JOB] := <1> 18.296, <2> 47.173, <3> 32.1713, <4> 13.4476, <5> 33.4059, <6> 14.8984, <7> 12.6217, <8> 24.7495, <9> 8.297, <10> 30.3995, <11> 16.2941, <12> 22.4437, <13> 46.0065, <14> 43.1019, <15> 34.8829, <16> 42.1679, <17> 21.2175, <18> 49.4833, <19> 34.7218, <20> 30.2992;
param capacity[MACHINE] := <1> 82.297, <2> 82.297, <3> 82.297, <4> 82.297, <5> 82.297, <6> 82.297, <7> 82.297;

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
