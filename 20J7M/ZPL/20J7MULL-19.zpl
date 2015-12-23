set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.5769, <2> 11.871, <3> 46.6573, <4> 5.3825, <5> 8.9887, <6> 20.8091, <7> 38.5242, <8> 44.6932, <9> 13.759, <10> 25.2647, <11> 3.2425, <12> 10.437, <13> 35.7485, <14> 14.9728, <15> 19.1825, <16> 20.0747, <17> 24.6715, <18> 40.0845, <19> 10.7335, <20> 36.3975;
param workload[JOB] := <1> 22.5769, <2> 11.871, <3> 46.6573, <4> 5.3825, <5> 8.9887, <6> 20.8091, <7> 38.5242, <8> 44.6932, <9> 13.759, <10> 25.2647, <11> 3.2425, <12> 10.437, <13> 35.7485, <14> 14.9728, <15> 19.1825, <16> 20.0747, <17> 24.6715, <18> 40.0845, <19> 10.7335, <20> 36.3975;
param capacity[MACHINE] := <1> 64.8674, <2> 64.8674, <3> 64.8674, <4> 64.8674, <5> 64.8674, <6> 64.8674, <7> 64.8674;

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
