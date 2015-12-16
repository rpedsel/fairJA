set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.101, <2> 6.5337, <3> 30.737, <4> 6.5076, <5> 11.7918, <6> 21.9708, <7> 15.577, <8> 41.8202, <9> 24.0106, <10> 17.6816;
param workload[JOB] := <1> 5.301, <2> 2.5561, <3> 5.5441, <4> 2.551, <5> 3.4339, <6> 4.6873, <7> 3.9468, <8> 6.4669, <9> 4.9001, <10> 4.2049;
param capacity[MACHINE] := <1> 10.898, <2> 10.898, <3> 10.898;

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
