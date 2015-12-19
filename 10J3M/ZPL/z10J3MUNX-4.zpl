set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.5898, <2> 11.9466, <3> 35.4669, <4> 48.1849, <5> 31.8497, <6> 22.2173, <7> 47.578, <8> 39.5933, <9> 13.1547, <10> 38.128;
param workload[JOB] := <1> 5.8813, <2> 3.4564, <3> 5.9554, <4> 6.9415, <5> 5.6436, <6> 4.7135, <7> 6.8977, <8> 6.2923, <9> 3.6269, <10> 6.1748;
param capacity[MACHINE] := <1> 55.5834, <2> 55.5834, <3> 55.5834;

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
