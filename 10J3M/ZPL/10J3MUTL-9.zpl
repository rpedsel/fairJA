set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6613, <2> 23.4064, <3> 43.1155, <4> 11.8928, <5> 5.5329, <6> 14.6644, <7> 13.3279, <8> 24.9486, <9> 29.621, <10> 40.5889;
param workload[JOB] := <1> 30.6613, <2> 23.4064, <3> 43.1155, <4> 11.8928, <5> 5.5329, <6> 14.6644, <7> 13.3279, <8> 24.9486, <9> 29.621, <10> 40.5889;
param capacity[MACHINE] := <1> 59.4399, <2> 59.4399, <3> 59.4399;

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
