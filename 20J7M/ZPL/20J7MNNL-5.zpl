set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.2178, <2> 20.3702, <3> 27.6645, <4> 23.9666, <5> 22.3122, <6> 27.3491, <7> 22.0743, <8> 21.6511, <9> 25.9263, <10> 28.8211, <11> 27.2492, <12> 29.3133, <13> 20.2391, <14> 28.2316, <15> 25.185, <16> 27.4124, <17> 25.3934, <18> 22.8069, <19> 25.2129, <20> 18.5995;
param workload[JOB] := <1> 20.2178, <2> 20.3702, <3> 27.6645, <4> 23.9666, <5> 22.3122, <6> 27.3491, <7> 22.0743, <8> 21.6511, <9> 25.9263, <10> 28.8211, <11> 27.2492, <12> 29.3133, <13> 20.2391, <14> 28.2316, <15> 25.185, <16> 27.4124, <17> 25.3934, <18> 22.8069, <19> 25.2129, <20> 18.5995;
param capacity[MACHINE] := <1> 489.9965, <2> 489.9965, <3> 489.9965, <4> 489.9965, <5> 489.9965, <6> 489.9965, <7> 489.9965;

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