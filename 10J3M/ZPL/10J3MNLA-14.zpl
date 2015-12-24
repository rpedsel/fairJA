set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.4164, <2> 28.1565, <3> 23.6639, <4> 17.6766, <5> 22.6617, <6> 30.6622, <7> 26.1699, <8> 20.5362, <9> 34.8628, <10> 27.6994;
param workload[JOB] := <1> 865.3246, <2> 792.7885, <3> 559.9802, <4> 312.4622, <5> 513.5526, <6> 940.1705, <7> 684.8637, <8> 421.7355, <9> 1215.4148, <10> 767.2568;
param capacity[MACHINE] := <1> 2357.8498, <2> 2357.8498, <3> 2357.8498;

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
