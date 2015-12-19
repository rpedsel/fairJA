set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.8322, <2> 25.0044, <3> 22.246, <4> 35.322, <5> 28.7959, <6> 30.0143, <7> 30.5714, <8> 26.0567, <9> 29.786, <10> 32.5379;
param workload[JOB] := <1> 433.9806, <2> 625.22, <3> 494.8845, <4> 1247.6437, <5> 829.2039, <6> 900.8582, <7> 934.6105, <8> 678.9516, <9> 887.2058, <10> 1058.7149;
param capacity[MACHINE] := <1> 2022.8184, <2> 2022.8184, <3> 2022.8184;

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
