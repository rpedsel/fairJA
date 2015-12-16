set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.6906, <2> 25.6902, <3> 28.4438, <4> 41.5689, <5> 24.0022, <6> 45.5608, <7> 27.1736, <8> 39.6484, <9> 49.2107, <10> 38.6224, <11> 47.8409, <12> 23.6579, <13> 35.7311, <14> 17.3521, <15> 17.6457, <16> 14.1901, <17> 31.8586, <18> 14.5715, <19> 38.267, <20> 2.584;
param workload[JOB] := <1> 19.0411, <2> 45.371, <3> 45.0848, <4> 33.5278, <5> 41.5652, <6> 42.7283, <7> 20.6338, <8> 24.9509, <9> 24.1033, <10> 38.1138, <11> 19.1176, <12> 4.8155, <13> 41.7456, <14> 6.8847, <15> 42.575, <16> 36.831, <17> 27.2541, <18> 41.1755, <19> 21.0784, <20> 27.6344;
param capacity[MACHINE] := <1> 75.529, <2> 75.529, <3> 75.529, <4> 75.529, <5> 75.529, <6> 75.529;

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
