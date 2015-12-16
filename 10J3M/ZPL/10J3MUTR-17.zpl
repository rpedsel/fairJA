set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0511, <2> 29.2023, <3> 11.4076, <4> 16.4124, <5> 3.825, <6> 4.7328, <7> 37.2335, <8> 23.7898, <9> 19.9167, <10> 22.3052;
param workload[JOB] := <1> 42.9788, <2> 27.8141, <3> 10.5406, <4> 35.0877, <5> 22.869, <6> 16.7881, <7> 26.7401, <8> 42.9104, <9> 15.0835, <10> 30.797;
param capacity[MACHINE] := <1> 67.9023, <2> 67.9023, <3> 67.9023;

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
