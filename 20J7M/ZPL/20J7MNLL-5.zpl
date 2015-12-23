set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3224, <2> 16.8398, <3> 19.5204, <4> 28.1437, <5> 30.093, <6> 26.5912, <7> 30.3444, <8> 25.6308, <9> 22.3, <10> 31.6565, <11> 28.3873, <12> 24.5706, <13> 22.498, <14> 22.2277, <15> 31.6133, <16> 20.1934, <17> 19.6658, <18> 32.9884, <19> 20.5193, <20> 19.5706;
param workload[JOB] := <1> 23.3224, <2> 16.8398, <3> 19.5204, <4> 28.1437, <5> 30.093, <6> 26.5912, <7> 30.3444, <8> 25.6308, <9> 22.3, <10> 31.6565, <11> 28.3873, <12> 24.5706, <13> 22.498, <14> 22.2277, <15> 31.6133, <16> 20.1934, <17> 19.6658, <18> 32.9884, <19> 20.5193, <20> 19.5706;
param capacity[MACHINE] := <1> 70.9538, <2> 70.9538, <3> 70.9538, <4> 70.9538, <5> 70.9538, <6> 70.9538, <7> 70.9538;

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
