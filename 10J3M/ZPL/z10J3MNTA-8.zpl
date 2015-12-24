set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.3378, <2> 29.0064, <3> 23.0291, <4> 21.5762, <5> 23.0276, <6> 19.3825, <7> 24.5555, <8> 28.2892, <9> 14.8336, <10> 18.268;
param workload[JOB] := <1> 642.0041, <2> 841.3712, <3> 530.3394, <4> 465.5324, <5> 530.2704, <6> 375.6813, <7> 602.9726, <8> 800.2788, <9> 220.0357, <10> 333.7198;
param capacity[MACHINE] := <1> 1335.5514, <2> 1335.5514, <3> 1335.5514;

var x[JM] binary;
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
