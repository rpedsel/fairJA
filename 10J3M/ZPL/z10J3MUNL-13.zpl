set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.5443, <2> 40.3321, <3> 45.3235, <4> 5.5582, <5> 23.8308, <6> 6.0589, <7> 26.1121, <8> 26.9973, <9> 42.2576, <10> 2.9111;
param workload[JOB] := <1> 33.5443, <2> 40.3321, <3> 45.3235, <4> 5.5582, <5> 23.8308, <6> 6.0589, <7> 26.1121, <8> 26.9973, <9> 42.2576, <10> 2.9111;
param capacity[MACHINE] := <1> 252.9259, <2> 252.9259, <3> 252.9259;

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
