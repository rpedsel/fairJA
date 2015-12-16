set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8184, <2> 19.7469, <3> 25.1806, <4> 20.9207, <5> 25.4491, <6> 23.737, <7> 28.689, <8> 25.6683, <9> 30.7918, <10> 20.0702;
param workload[JOB] := <1> 44.6906, <2> 14.5849, <3> 2.6817, <4> 16.8314, <5> 28.6613, <6> 28.0002, <7> 1.752, <8> 32.8895, <9> 35.5944, <10> 25.5408;
param capacity[MACHINE] := <1> 57.8067, <2> 57.8067, <3> 57.8067;

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
