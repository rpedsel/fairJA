set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.9394, <2> 26.4652, <3> 22.4693, <4> 26.1878, <5> 26.6716, <6> 19.1447, <7> 27.2819, <8> 27.3291, <9> 31.797, <10> 22.8452, <11> 20.4625, <12> 20.7169, <13> 24.0504, <14> 30.0278, <15> 20.174, <16> 24.7089, <17> 14.06, <18> 27.8615, <19> 21.4975, <20> 28.3882;
param workload[JOB] := <1> 15.9394, <2> 26.4652, <3> 22.4693, <4> 26.1878, <5> 26.6716, <6> 19.1447, <7> 27.2819, <8> 27.3291, <9> 31.797, <10> 22.8452, <11> 20.4625, <12> 20.7169, <13> 24.0504, <14> 30.0278, <15> 20.174, <16> 24.7089, <17> 14.06, <18> 27.8615, <19> 21.4975, <20> 28.3882;
param capacity[MACHINE] := <1> 79.6798, <2> 79.6798, <3> 79.6798, <4> 79.6798, <5> 79.6798, <6> 79.6798;

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
