set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.655, <2> 23.2227, <3> 16.7692, <4> 25.3682, <5> 22.1291, <6> 29.0869, <7> 21.3643, <8> 20.4107, <9> 30.0407, <10> 25.3488;
param workload[JOB] := <1> 939.729, <2> 539.2938, <3> 281.2061, <4> 643.5456, <5> 489.6971, <6> 846.0478, <7> 456.4333, <8> 416.5967, <9> 902.4437, <10> 642.5617;
param capacity[MACHINE] := <1> 6157.5548, <2> 6157.5548, <3> 6157.5548;

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
