set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3224, <2> 26.7494, <3> 27.6351, <4> 20.6117, <5> 25.431, <6> 21.8049, <7> 23.9749, <8> 13.5026, <9> 27.2904, <10> 24.4176;
param workload[JOB] := <1> 498.2895, <2> 715.5304, <3> 763.6988, <4> 424.8422, <5> 646.7358, <6> 475.4537, <7> 574.7958, <8> 182.3202, <9> 744.7659, <10> 596.2192;
param capacity[MACHINE] := <1> 5622.6515, <2> 5622.6515, <3> 5622.6515;

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
