set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4094, <2> 26.6768, <3> 30.2385, <4> 30.7204, <5> 25.2216, <6> 33.0764, <7> 23.5944, <8> 29.1671, <9> 21.4197, <10> 25.364;
param workload[JOB] := <1> 24.4094, <2> 26.6768, <3> 30.2385, <4> 30.7204, <5> 25.2216, <6> 33.0764, <7> 23.5944, <8> 29.1671, <9> 21.4197, <10> 25.364;
param capacity[MACHINE] := <1> 67.4721, <2> 67.4721, <3> 67.4721;

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
