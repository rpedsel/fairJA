set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.9473, <2> 27.2241, <3> 21.7622, <4> 22.5596, <5> 19.1374, <6> 28.7212, <7> 20.6658, <8> 23.0114, <9> 26.0338, <10> 27.0959, <11> 28.9076, <12> 30.8482, <13> 29.8831, <14> 12.4269, <15> 26.9535, <16> 23.404, <17> 21.0965, <18> 20.5872, <19> 23.1197, <20> 25.5617;
param workload[JOB] := <1> 22.9473, <2> 27.2241, <3> 21.7622, <4> 22.5596, <5> 19.1374, <6> 28.7212, <7> 20.6658, <8> 23.0114, <9> 26.0338, <10> 27.0959, <11> 28.9076, <12> 30.8482, <13> 29.8831, <14> 12.4269, <15> 26.9535, <16> 23.404, <17> 21.0965, <18> 20.5872, <19> 23.1197, <20> 25.5617;
param capacity[MACHINE] := <1> 51.6372, <2> 51.6372, <3> 51.6372, <4> 51.6372, <5> 51.6372, <6> 51.6372, <7> 51.6372;

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
