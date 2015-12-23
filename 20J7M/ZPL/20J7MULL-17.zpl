set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.1063, <2> 4.2383, <3> 26.246, <4> 13.7765, <5> 6.8189, <6> 10.6384, <7> 49.1262, <8> 47.2728, <9> 10.5655, <10> 38.1249, <11> 22.9164, <12> 37.6181, <13> 17.0523, <14> 15.77, <15> 12.0441, <16> 29.4852, <17> 0.4786, <18> 27.7723, <19> 15.2508, <20> 45.2504;
param workload[JOB] := <1> 49.1063, <2> 4.2383, <3> 26.246, <4> 13.7765, <5> 6.8189, <6> 10.6384, <7> 49.1262, <8> 47.2728, <9> 10.5655, <10> 38.1249, <11> 22.9164, <12> 37.6181, <13> 17.0523, <14> 15.77, <15> 12.0441, <16> 29.4852, <17> 0.4786, <18> 27.7723, <19> 15.2508, <20> 45.2504;
param capacity[MACHINE] := <1> 68.5074, <2> 68.5074, <3> 68.5074, <4> 68.5074, <5> 68.5074, <6> 68.5074, <7> 68.5074;

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
