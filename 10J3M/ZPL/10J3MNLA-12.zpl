set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0222, <2> 28.2962, <3> 20.5864, <4> 31.9727, <5> 19.8785, <6> 24.5154, <7> 28.2405, <8> 19.1545, <9> 18.1493, <10> 19.6262;
param workload[JOB] := <1> 441.9329, <2> 800.6749, <3> 423.7999, <4> 1022.2535, <5> 395.1548, <6> 601.0048, <7> 797.5258, <8> 366.8949, <9> 329.3971, <10> 385.1877;
param capacity[MACHINE] := <1> 1854.6088, <2> 1854.6088, <3> 1854.6088;

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
