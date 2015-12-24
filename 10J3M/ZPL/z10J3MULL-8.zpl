set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.2445, <2> 30.2206, <3> 9.6273, <4> 43.8632, <5> 24.9923, <6> 18.5453, <7> 35.4815, <8> 32.6049, <9> 16.5585, <10> 26.4829;
param workload[JOB] := <1> 25.2445, <2> 30.2206, <3> 9.6273, <4> 43.8632, <5> 24.9923, <6> 18.5453, <7> 35.4815, <8> 32.6049, <9> 16.5585, <10> 26.4829;
param capacity[MACHINE] := <1> 87.8737, <2> 87.8737, <3> 87.8737;

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
