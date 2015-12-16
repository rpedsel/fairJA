set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.9537, <2> 24.672, <3> 25.4852, <4> 21.0491, <5> 26.7203, <6> 25.8834, <7> 31.6361, <8> 24.137, <9> 30.6075, <10> 25.2088;
param workload[JOB] := <1> 23.8927, <2> 38.5275, <3> 18.5137, <4> 48.7545, <5> 28.9416, <6> 10.9729, <7> 36.4788, <8> 12.2186, <9> 2.5665, <10> 13.1144;
param capacity[MACHINE] := <1> 233.9812, <2> 233.9812, <3> 233.9812;

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
