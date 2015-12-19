set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3056, <2> 21.2928, <3> 15.8899, <4> 29.5279, <5> 17.9324, <6> 30.2754, <7> 32.6882, <8> 21.4527, <9> 21.7205, <10> 29.315;
param workload[JOB] := <1> 543.151, <2> 453.3833, <3> 252.4889, <4> 871.8969, <5> 321.571, <6> 916.5998, <7> 1068.5184, <8> 460.2183, <9> 471.7801, <10> 859.3692;
param capacity[MACHINE] := <1> 2072.9923, <2> 2072.9923, <3> 2072.9923;

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
