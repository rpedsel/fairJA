set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0248, <2> 19.9999, <3> 29.359, <4> 20.7411, <5> 28.7016, <6> 23.9194, <7> 26.7989, <8> 23.0712, <9> 21.2639, <10> 17.1828, <11> 23.3378, <12> 34.6739, <13> 21.8153, <14> 32.8147, <15> 27.7433, <16> 23.4322, <17> 24.1014, <18> 29.5885, <19> 25.6924, <20> 24.5094;
param workload[JOB] := <1> 32.7754, <2> 1.1181, <3> 28.3496, <4> 11.4277, <5> 40.105, <6> 49.7291, <7> 33.9898, <8> 28.8762, <9> 37.6005, <10> 0.633, <11> 44.698, <12> 45.0326, <13> 29.321, <14> 26.737, <15> 28.9991, <16> 48.7248, <17> 10.6346, <18> 35.646, <19> 3.4269, <20> 19.19;
param capacity[MACHINE] := <1> 79.5735, <2> 79.5735, <3> 79.5735, <4> 79.5735, <5> 79.5735, <6> 79.5735, <7> 79.5735;

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
