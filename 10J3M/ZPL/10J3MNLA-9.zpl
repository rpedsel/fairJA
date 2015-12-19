set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.2004, <2> 17.8747, <3> 26.8993, <4> 18.1177, <5> 31.7105, <6> 33.5404, <7> 14.0304, <8> 22.1827, <9> 30.761, <10> 23.6539;
param workload[JOB] := <1> 1169.6674, <2> 319.5049, <3> 723.5723, <4> 328.2511, <5> 1005.5558, <6> 1124.9584, <7> 196.8521, <8> 492.0722, <9> 946.2391, <10> 559.507;
param capacity[MACHINE] := <1> 2288.7268, <2> 2288.7268, <3> 2288.7268;

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
