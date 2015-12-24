set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.8515, <2> 25.5055, <3> 17.2383, <4> 12.9147, <5> 26.704, <6> 17.0917, <7> 16.4757, <8> 35.8212, <9> 24.9589, <10> 34.984, <11> 30.0689, <12> 31.936, <13> 29.4339, <14> 11.1241, <15> 25.4867, <16> 20.7703, <17> 18.5936, <18> 25.8518, <19> 27.4457, <20> 23.8462;
param workload[JOB] := <1> 5.2775, <2> 5.0503, <3> 4.1519, <4> 3.5937, <5> 5.1676, <6> 4.1342, <7> 4.059, <8> 5.9851, <9> 4.9959, <10> 5.9147, <11> 5.4835, <12> 5.6512, <13> 5.4253, <14> 3.3353, <15> 5.0484, <16> 4.5574, <17> 4.312, <18> 5.0845, <19> 5.2389, <20> 4.8833;
param capacity[MACHINE] := <1> 97.3497, <2> 97.3497, <3> 97.3497, <4> 97.3497, <5> 97.3497, <6> 97.3497, <7> 97.3497;

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
