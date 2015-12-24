set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.4971, <2> 20.9656, <3> 32.8282, <4> 24.4549, <5> 17.2008, <6> 16.3136, <7> 25.2341, <8> 28.0565, <9> 18.6692, <10> 27.3097, <11> 24.8815, <12> 20.5468, <13> 20.1824, <14> 32.689, <15> 16.2698, <16> 22.1276, <17> 23.2953, <18> 20.9468, <19> 25.8524, <20> 28.98;
param workload[JOB] := <1> 5.9579, <2> 4.5788, <3> 5.7296, <4> 4.9452, <5> 4.1474, <6> 4.039, <7> 5.0234, <8> 5.2968, <9> 4.3208, <10> 5.2259, <11> 4.9881, <12> 4.5329, <13> 4.4925, <14> 5.7174, <15> 4.0336, <16> 4.704, <17> 4.8265, <18> 4.5768, <19> 5.0845, <20> 5.3833;
param capacity[MACHINE] := <1> 97.6044, <2> 97.6044, <3> 97.6044, <4> 97.6044, <5> 97.6044, <6> 97.6044, <7> 97.6044;

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
