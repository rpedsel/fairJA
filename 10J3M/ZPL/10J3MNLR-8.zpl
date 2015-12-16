set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3004, <2> 21.0171, <3> 19.8252, <4> 30.6353, <5> 26.9059, <6> 27.5246, <7> 21.4227, <8> 26.5301, <9> 19.0969, <10> 23.0579;
param workload[JOB] := <1> 40.8939, <2> 23.7105, <3> 32.5106, <4> 24.2851, <5> 43.7974, <6> 41.2176, <7> 23.3701, <8> 39.8527, <9> 4.496, <10> 14.4006;
param capacity[MACHINE] := <1> 96.1782, <2> 96.1782, <3> 96.1782;

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
