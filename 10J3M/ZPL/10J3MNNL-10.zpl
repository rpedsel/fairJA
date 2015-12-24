set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0381, <2> 28.7217, <3> 24.4152, <4> 30.1496, <5> 25.1073, <6> 23.8568, <7> 25.9668, <8> 23.1905, <9> 28.0606, <10> 20.0139;
param workload[JOB] := <1> 23.0381, <2> 28.7217, <3> 24.4152, <4> 30.1496, <5> 25.1073, <6> 23.8568, <7> 25.9668, <8> 23.1905, <9> 28.0606, <10> 20.0139;
param capacity[MACHINE] := <1> 252.5205, <2> 252.5205, <3> 252.5205;

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
