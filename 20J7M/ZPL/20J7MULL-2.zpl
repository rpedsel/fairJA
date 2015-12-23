set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8402, <2> 22.0015, <3> 8.9428, <4> 30.3357, <5> 1.4318, <6> 29.2085, <7> 30.5037, <8> 41.217, <9> 16.4599, <10> 26.781, <11> 8.8458, <12> 2.804, <13> 39.817, <14> 26.4724, <15> 24.4205, <16> 39.8976, <17> 6.3012, <18> 18.7213, <19> 32.3087, <20> 18.4548;
param workload[JOB] := <1> 28.8402, <2> 22.0015, <3> 8.9428, <4> 30.3357, <5> 1.4318, <6> 29.2085, <7> 30.5037, <8> 41.217, <9> 16.4599, <10> 26.781, <11> 8.8458, <12> 2.804, <13> 39.817, <14> 26.4724, <15> 24.4205, <16> 39.8976, <17> 6.3012, <18> 18.7213, <19> 32.3087, <20> 18.4548;
param capacity[MACHINE] := <1> 64.8236, <2> 64.8236, <3> 64.8236, <4> 64.8236, <5> 64.8236, <6> 64.8236, <7> 64.8236;

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
