set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.8462, <2> 37.2029, <3> 14.2116, <4> 49.1408, <5> 6.4568, <6> 46.4134, <7> 49.0919, <8> 37.9543, <9> 30.4968, <10> 12.5114;
param workload[JOB] := <1> 1145.5653, <2> 1384.0558, <3> 201.9696, <4> 2414.8182, <5> 41.6903, <6> 2154.2037, <7> 2410.0146, <8> 1440.5289, <9> 930.0548, <10> 156.5351;
param capacity[MACHINE] := <1> 12279.4363, <2> 12279.4363, <3> 12279.4363;

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
