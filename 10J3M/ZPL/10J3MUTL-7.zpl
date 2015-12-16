set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.7969, <2> 1.3676, <3> 40.4049, <4> 23.7934, <5> 49.3245, <6> 4.2363, <7> 44.9558, <8> 24.3115, <9> 15.3735, <10> 43.4865;
param workload[JOB] := <1> 8.7969, <2> 1.3676, <3> 40.4049, <4> 23.7934, <5> 49.3245, <6> 4.2363, <7> 44.9558, <8> 24.3115, <9> 15.3735, <10> 43.4865;
param capacity[MACHINE] := <1> 64.0127, <2> 64.0127, <3> 64.0127;

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
