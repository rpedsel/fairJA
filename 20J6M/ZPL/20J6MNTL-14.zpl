set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.9152, <2> 28.4762, <3> 26.4663, <4> 18.2307, <5> 28.9282, <6> 24.3146, <7> 28.1707, <8> 22.7738, <9> 19.5033, <10> 27.4151, <11> 24.7361, <12> 27.8126, <13> 28.3584, <14> 23.6847, <15> 20.9071, <16> 26.5602, <17> 30.4702, <18> 26.1784, <19> 23.7853, <20> 22.0822;
param workload[JOB] := <1> 33.9152, <2> 28.4762, <3> 26.4663, <4> 18.2307, <5> 28.9282, <6> 24.3146, <7> 28.1707, <8> 22.7738, <9> 19.5033, <10> 27.4151, <11> 24.7361, <12> 27.8126, <13> 28.3584, <14> 23.6847, <15> 20.9071, <16> 26.5602, <17> 30.4702, <18> 26.1784, <19> 23.7853, <20> 22.0822;
param capacity[MACHINE] := <1> 64.0962, <2> 64.0962, <3> 64.0962, <4> 64.0962, <5> 64.0962, <6> 64.0962;

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
