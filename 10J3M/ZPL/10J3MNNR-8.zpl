set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.746, <2> 16.7561, <3> 24.4573, <4> 30.1363, <5> 37.2098, <6> 35.6462, <7> 28.8471, <8> 26.578, <9> 24.7745, <10> 27.6607;
param workload[JOB] := <1> 48.4553, <2> 39.4684, <3> 19.9046, <4> 20.5698, <5> 49.4365, <6> 6.4636, <7> 39.4485, <8> 27.8726, <9> 33.3148, <10> 20.6536;
param capacity[MACHINE] := <1> 305.5877, <2> 305.5877, <3> 305.5877;

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
