set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.5405, <2> 17.3351, <3> 2.4498, <4> 49.457, <5> 6.4257, <6> 49.7393, <7> 36.6804, <8> 23.1955, <9> 27.5913, <10> 36.9947;
param workload[JOB] := <1> 12.5351, <2> 300.5057, <3> 6.0015, <4> 2445.9948, <5> 41.2896, <6> 2473.998, <7> 1345.4517, <8> 538.0312, <9> 761.2798, <10> 1368.6078;
param capacity[MACHINE] := <1> 3097.8984, <2> 3097.8984, <3> 3097.8984;

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
