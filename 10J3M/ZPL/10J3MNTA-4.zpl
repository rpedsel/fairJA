set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1671, <2> 17.1437, <3> 19.6957, <4> 24.6149, <5> 22.2413, <6> 24.7919, <7> 28.1068, <8> 22.5087, <9> 28.6797, <10> 30.7658;
param workload[JOB] := <1> 584.0487, <2> 293.9064, <3> 387.9206, <4> 605.8933, <5> 494.6754, <6> 614.6383, <7> 789.9922, <8> 506.6416, <9> 822.5252, <10> 946.5344;
param capacity[MACHINE] := <1> 1511.694, <2> 1511.694, <3> 1511.694;

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
