set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.2586, <2> 2.7161, <3> 22.6792, <4> 8.403, <5> 42.3874, <6> 11.8458, <7> 48.356, <8> 48.0925, <9> 16.1073, <10> 21.7034;
param workload[JOB] := <1> 12.6321, <2> 26.9469, <3> 2.0701, <4> 23.4432, <5> 11.4036, <6> 16.5159, <7> 0.7702, <8> 35.8901, <9> 17.2112, <10> 22.9443;
param capacity[MACHINE] := <1> 169.8276, <2> 169.8276, <3> 169.8276;

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
