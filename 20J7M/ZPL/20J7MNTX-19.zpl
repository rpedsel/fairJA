set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.7457, <2> 24.576, <3> 27.6907, <4> 29.6972, <5> 24.4991, <6> 23.3561, <7> 22.9547, <8> 29.2574, <9> 14.1039, <10> 30.9907, <11> 23.9375, <12> 20.1065, <13> 26.7085, <14> 27.9717, <15> 22.2822, <16> 26.4009, <17> 28.4678, <18> 27.7435, <19> 23.9956, <20> 25.6897;
param workload[JOB] := <1> 4.7692, <2> 4.9574, <3> 5.2622, <4> 5.4495, <5> 4.9497, <6> 4.8328, <7> 4.7911, <8> 5.409, <9> 3.7555, <10> 5.5669, <11> 4.8926, <12> 4.484, <13> 5.168, <14> 5.2888, <15> 4.7204, <16> 5.1382, <17> 5.3355, <18> 5.2672, <19> 4.8985, <20> 5.0685;
param capacity[MACHINE] := <1> 10.7148, <2> 10.7148, <3> 10.7148, <4> 10.7148, <5> 10.7148, <6> 10.7148, <7> 10.7148;

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
