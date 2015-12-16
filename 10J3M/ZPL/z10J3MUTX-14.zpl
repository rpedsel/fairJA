set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.43, <2> 33.7105, <3> 49.4698, <4> 40.1918, <5> 28.5203, <6> 47.8759, <7> 28.9241, <8> 37.5593, <9> 34.9488, <10> 19.5166;
param workload[JOB] := <1> 4.8405, <2> 5.8061, <3> 7.0335, <4> 6.3397, <5> 5.3404, <6> 6.9192, <7> 5.3781, <8> 6.1286, <9> 5.9118, <10> 4.4178;
param capacity[MACHINE] := <1> 14.5289, <2> 14.5289, <3> 14.5289;

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
