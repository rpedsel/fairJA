set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.6258, <2> 9.2638, <3> 26.4336, <4> 25.6895, <5> 28.7225, <6> 23.5049, <7> 26.3043, <8> 20.1678, <9> 15.5219, <10> 29.4001, <11> 21.1981, <12> 26.3198, <13> 22.1311, <14> 22.2607, <15> 24.8674, <16> 23.9008, <17> 30.778, <18> 33.3637, <19> 23.5956, <20> 31.1805;
param workload[JOB] := <1> 21.6258, <2> 9.2638, <3> 26.4336, <4> 25.6895, <5> 28.7225, <6> 23.5049, <7> 26.3043, <8> 20.1678, <9> 15.5219, <10> 29.4001, <11> 21.1981, <12> 26.3198, <13> 22.1311, <14> 22.2607, <15> 24.8674, <16> 23.9008, <17> 30.778, <18> 33.3637, <19> 23.5956, <20> 31.1805;
param capacity[MACHINE] := <1> 52.096, <2> 52.096, <3> 52.096, <4> 52.096, <5> 52.096, <6> 52.096, <7> 52.096;

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
