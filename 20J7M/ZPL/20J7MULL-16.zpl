set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.428, <2> 2.4454, <3> 24.2094, <4> 13.9151, <5> 49.0236, <6> 19.6638, <7> 11.0486, <8> 1.1363, <9> 46.9825, <10> 17.1545, <11> 16.4965, <12> 22.5556, <13> 6.7513, <14> 41.4684, <15> 27.8801, <16> 4.8228, <17> 2.0497, <18> 30.0004, <19> 21.5433, <20> 6.8378;
param workload[JOB] := <1> 44.428, <2> 2.4454, <3> 24.2094, <4> 13.9151, <5> 49.0236, <6> 19.6638, <7> 11.0486, <8> 1.1363, <9> 46.9825, <10> 17.1545, <11> 16.4965, <12> 22.5556, <13> 6.7513, <14> 41.4684, <15> 27.8801, <16> 4.8228, <17> 2.0497, <18> 30.0004, <19> 21.5433, <20> 6.8378;
param capacity[MACHINE] := <1> 58.6304, <2> 58.6304, <3> 58.6304, <4> 58.6304, <5> 58.6304, <6> 58.6304, <7> 58.6304;

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
