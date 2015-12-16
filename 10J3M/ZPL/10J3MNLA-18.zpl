set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.4164, <2> 27.2325, <3> 22.9656, <4> 21.3169, <5> 30.1082, <6> 14.0773, <7> 32.4607, <8> 28.095, <9> 26.8973, <10> 29.5434;
param workload[JOB] := <1> 807.4918, <2> 741.6091, <3> 527.4188, <4> 454.4102, <5> 906.5037, <6> 198.1704, <7> 1053.697, <8> 789.329, <9> 723.4647, <10> 872.8125;
param capacity[MACHINE] := <1> 2358.3024, <2> 2358.3024, <3> 2358.3024;

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
