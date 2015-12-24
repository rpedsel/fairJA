set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.6938, <2> 21.1155, <3> 29.5213, <4> 24.1786, <5> 17.5747, <6> 26.4944, <7> 17.0057, <8> 18.8743, <9> 16.2779, <10> 23.7368;
param workload[JOB] := <1> 1004.497, <2> 445.8643, <3> 871.5072, <4> 584.6047, <5> 308.8701, <6> 701.9532, <7> 289.1938, <8> 356.2392, <9> 264.97, <10> 563.4357;
param capacity[MACHINE] := <1> 5391.1352, <2> 5391.1352, <3> 5391.1352;

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
