set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8091, <2> 25.2641, <3> 20.248, <4> 29.1996, <5> 28.9588, <6> 30.4249, <7> 15.8785, <8> 31.3127, <9> 22.8045, <10> 28.0094, <11> 24.7625, <12> 27.6861, <13> 30.9432, <14> 22.94, <15> 27.7354, <16> 28.2214, <17> 19.0155, <18> 25.2837, <19> 27.8959, <20> 24.4939;
param workload[JOB] := <1> 5.3674, <2> 5.0263, <3> 4.4998, <4> 5.4037, <5> 5.3813, <6> 5.5159, <7> 3.9848, <8> 5.5958, <9> 4.7754, <10> 5.2924, <11> 4.9762, <12> 5.2618, <13> 5.5627, <14> 4.7896, <15> 5.2664, <16> 5.3124, <17> 4.3607, <18> 5.0283, <19> 5.2817, <20> 4.9491;
param capacity[MACHINE] := <1> 14.5188, <2> 14.5188, <3> 14.5188, <4> 14.5188, <5> 14.5188, <6> 14.5188, <7> 14.5188;

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
