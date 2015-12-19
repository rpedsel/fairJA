set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.187, <2> 19.735, <3> 11.4311, <4> 44.1793, <5> 49.4727, <6> 49.0792, <7> 14.3677, <8> 36.7567, <9> 19.3864, <10> 18.8715;
param workload[JOB] := <1> 49.4738, <2> 25.5401, <3> 33.7273, <4> 11.7496, <5> 28.8415, <6> 20.9001, <7> 29.0329, <8> 30.7889, <9> 24.0249, <10> 40.7432;
param capacity[MACHINE] := <1> 73.7056, <2> 73.7056, <3> 73.7056;

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
