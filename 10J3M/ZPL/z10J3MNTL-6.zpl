set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.8054, <2> 12.1952, <3> 24.0433, <4> 29.3701, <5> 23.4628, <6> 28.405, <7> 31.3731, <8> 24.6939, <9> 28.3469, <10> 22.2633;
param workload[JOB] := <1> 25.8054, <2> 12.1952, <3> 24.0433, <4> 29.3701, <5> 23.4628, <6> 28.405, <7> 31.3731, <8> 24.6939, <9> 28.3469, <10> 22.2633;
param capacity[MACHINE] := <1> 62.4898, <2> 62.4898, <3> 62.4898;

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
