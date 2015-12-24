set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.472, <2> 21.4752, <3> 29.6863, <4> 19.5036, <5> 27.8694, <6> 23.843, <7> 25.4708, <8> 29.8154, <9> 19.2735, <10> 22.1421;
param workload[JOB] := <1> 25.472, <2> 21.4752, <3> 29.6863, <4> 19.5036, <5> 27.8694, <6> 23.843, <7> 25.4708, <8> 29.8154, <9> 19.2735, <10> 22.1421;
param capacity[MACHINE] := <1> 61.1378, <2> 61.1378, <3> 61.1378;

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
