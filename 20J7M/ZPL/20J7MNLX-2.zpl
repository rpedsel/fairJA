set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7346, <2> 29.9413, <3> 25.0404, <4> 17.8618, <5> 35.78, <6> 21.6159, <7> 28.9838, <8> 20.4493, <9> 24.1949, <10> 19.5666, <11> 27.171, <12> 22.3821, <13> 29.9885, <14> 32.6366, <15> 26.2086, <16> 24.3582, <17> 23.139, <18> 35.0541, <19> 22.929, <20> 22.6804;
param workload[JOB] := <1> 5.5439, <2> 5.4719, <3> 5.004, <4> 4.2263, <5> 5.9816, <6> 4.6493, <7> 5.3837, <8> 4.5221, <9> 4.9188, <10> 4.4234, <11> 5.2126, <12> 4.731, <13> 5.4762, <14> 5.7128, <15> 5.1194, <16> 4.9354, <17> 4.8103, <18> 5.9207, <19> 4.7884, <20> 4.7624;
param capacity[MACHINE] := <1> 14.5135, <2> 14.5135, <3> 14.5135, <4> 14.5135, <5> 14.5135, <6> 14.5135, <7> 14.5135;

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
