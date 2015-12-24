set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.0678, <2> 8.9649, <3> 41.7582, <4> 43.093, <5> 2.8758, <6> 33.0272, <7> 3.6875, <8> 47.5478, <9> 10.2654, <10> 47.1075;
param workload[JOB] := <1> 3.173, <2> 2.9941, <3> 6.4621, <4> 6.5645, <5> 1.6958, <6> 5.7469, <7> 1.9203, <8> 6.8955, <9> 3.204, <10> 6.8635;
param capacity[MACHINE] := <1> 11.3799, <2> 11.3799, <3> 11.3799;

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
