set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2112, <2> 20.9874, <3> 24.2838, <4> 29.3651, <5> 26.5935, <6> 28.0226, <7> 26.9244, <8> 17.3503, <9> 30.3474, <10> 22.91, <11> 20.4545, <12> 24.9128, <13> 32.104, <14> 27.8393, <15> 23.323, <16> 31.3473, <17> 21.4607, <18> 18.3683, <19> 20.7905, <20> 29.5242;
param workload[JOB] := <1> 5.0211, <2> 4.5812, <3> 4.9279, <4> 5.419, <5> 5.1569, <6> 5.2936, <7> 5.1889, <8> 4.1654, <9> 5.5088, <10> 4.7864, <11> 4.5227, <12> 4.9913, <13> 5.666, <14> 5.2763, <15> 4.8294, <16> 5.5989, <17> 4.6326, <18> 4.2858, <19> 4.5597, <20> 5.4336;
param capacity[MACHINE] := <1> 99.8455, <2> 99.8455, <3> 99.8455, <4> 99.8455, <5> 99.8455, <6> 99.8455, <7> 99.8455;

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
