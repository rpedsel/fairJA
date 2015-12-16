set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.2607, <2> 28.4457, <3> 27.7573, <4> 23.0587, <5> 18.4571, <6> 24.0186, <7> 23.6128, <8> 25.5898, <9> 21.2815, <10> 21.9212, <11> 27.4232, <12> 18.4648, <13> 22.881, <14> 15.9828, <15> 21.5399, <16> 25.3237, <17> 27.2298, <18> 22.0929, <19> 21.6199, <20> 22.3108;
param workload[JOB] := <1> 5.5911, <2> 5.3335, <3> 5.2685, <4> 4.8019, <5> 4.2962, <6> 4.9009, <7> 4.8593, <8> 5.0586, <9> 4.6132, <10> 4.682, <11> 5.2367, <12> 4.2971, <13> 4.7834, <14> 3.9978, <15> 4.6411, <16> 5.0323, <17> 5.2182, <18> 4.7003, <19> 4.6497, <20> 4.7234;
param capacity[MACHINE] := <1> 96.6852, <2> 96.6852, <3> 96.6852, <4> 96.6852, <5> 96.6852, <6> 96.6852;

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
