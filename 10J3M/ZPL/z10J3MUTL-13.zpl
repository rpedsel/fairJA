set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.0593, <2> 22.9766, <3> 10.9528, <4> 17.8279, <5> 35.4059, <6> 9.5958, <7> 21.4691, <8> 38.4642, <9> 40.9301, <10> 47.8133;
param workload[JOB] := <1> 37.0593, <2> 22.9766, <3> 10.9528, <4> 17.8279, <5> 35.4059, <6> 9.5958, <7> 21.4691, <8> 38.4642, <9> 40.9301, <10> 47.8133;
param capacity[MACHINE] := <1> 70.6238, <2> 70.6238, <3> 70.6238;

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
