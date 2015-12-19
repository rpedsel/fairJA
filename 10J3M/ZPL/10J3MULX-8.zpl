set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6838, <2> 9.7582, <3> 45.8736, <4> 8.8492, <5> 46.4253, <6> 43.5346, <7> 32.2352, <8> 3.2481, <9> 5.688, <10> 20.0931;
param workload[JOB] := <1> 5.5393, <2> 3.1238, <3> 6.773, <4> 2.9748, <5> 6.8136, <6> 6.5981, <7> 5.6776, <8> 1.8022, <9> 2.385, <10> 4.4825;
param capacity[MACHINE] := <1> 15.39, <2> 15.39, <3> 15.39;

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
