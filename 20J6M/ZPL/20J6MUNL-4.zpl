set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.991, <2> 1.9226, <3> 13.3793, <4> 8.1009, <5> 20.6466, <6> 38.9452, <7> 29.5874, <8> 22.3209, <9> 29.6859, <10> 10.1725, <11> 45.7765, <12> 9.3807, <13> 9.4801, <14> 31.0813, <15> 26.1971, <16> 34.8617, <17> 5.4805, <18> 22.6983, <19> 23.9227, <20> 26.6952;
param workload[JOB] := <1> 9.991, <2> 1.9226, <3> 13.3793, <4> 8.1009, <5> 20.6466, <6> 38.9452, <7> 29.5874, <8> 22.3209, <9> 29.6859, <10> 10.1725, <11> 45.7765, <12> 9.3807, <13> 9.4801, <14> 31.0813, <15> 26.1971, <16> 34.8617, <17> 5.4805, <18> 22.6983, <19> 23.9227, <20> 26.6952;
param capacity[MACHINE] := <1> 420.3264, <2> 420.3264, <3> 420.3264, <4> 420.3264, <5> 420.3264, <6> 420.3264;

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
