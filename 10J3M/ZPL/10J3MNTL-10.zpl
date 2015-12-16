set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.1244, <2> 20.851, <3> 23.4606, <4> 23.1514, <5> 27.4525, <6> 29.1693, <7> 22.5367, <8> 20.5569, <9> 24.1593, <10> 25.8304;
param workload[JOB] := <1> 16.1244, <2> 20.851, <3> 23.4606, <4> 23.1514, <5> 27.4525, <6> 29.1693, <7> 22.5367, <8> 20.5569, <9> 24.1593, <10> 25.8304;
param capacity[MACHINE] := <1> 58.3231, <2> 58.3231, <3> 58.3231;

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
