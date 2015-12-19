set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2951, <2> 11.6449, <3> 8.943, <4> 44.903, <5> 7.0473, <6> 46.0912, <7> 21.8116, <8> 14.7008, <9> 1.4674, <10> 0.8026;
param workload[JOB] := <1> 4.7218, <2> 3.4125, <3> 2.9905, <4> 6.701, <5> 2.6547, <6> 6.7891, <7> 4.6703, <8> 3.8342, <9> 1.2114, <10> 0.8959;
param capacity[MACHINE] := <1> 9.4703, <2> 9.4703, <3> 9.4703;

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
