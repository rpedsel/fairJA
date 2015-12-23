set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.9832, <2> 22.2601, <3> 45.0101, <4> 31.5999, <5> 1.4434, <6> 6.2853, <7> 15.515, <8> 38.3839, <9> 26.8174, <10> 37.7903, <11> 8.4818, <12> 19.1978, <13> 8.0934, <14> 9.0929, <15> 21.8619, <16> 13.4898, <17> 8.131, <18> 9.2503, <19> 45.3227, <20> 0.793;
param workload[JOB] := <1> 43.9832, <2> 22.2601, <3> 45.0101, <4> 31.5999, <5> 1.4434, <6> 6.2853, <7> 15.515, <8> 38.3839, <9> 26.8174, <10> 37.7903, <11> 8.4818, <12> 19.1978, <13> 8.0934, <14> 9.0929, <15> 21.8619, <16> 13.4898, <17> 8.131, <18> 9.2503, <19> 45.3227, <20> 0.793;
param capacity[MACHINE] := <1> 412.8032, <2> 412.8032, <3> 412.8032, <4> 412.8032, <5> 412.8032, <6> 412.8032, <7> 412.8032;

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
