set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.273, <2> 40.9317, <3> 30.6909, <4> 16.5136, <5> 3.388, <6> 6.8016, <7> 48.6484, <8> 21.6497, <9> 20.2727, <10> 42.251, <11> 17.9505, <12> 16.25, <13> 0.2834, <14> 24.7406, <15> 45.4774, <16> 2.4571, <17> 2.1759, <18> 36.2258, <19> 44.8082, <20> 43.1979;
param workload[JOB] := <1> 4.273, <2> 40.9317, <3> 30.6909, <4> 16.5136, <5> 3.388, <6> 6.8016, <7> 48.6484, <8> 21.6497, <9> 20.2727, <10> 42.251, <11> 17.9505, <12> 16.25, <13> 0.2834, <14> 24.7406, <15> 45.4774, <16> 2.4571, <17> 2.1759, <18> 36.2258, <19> 44.8082, <20> 43.1979;
param capacity[MACHINE] := <1> 58.6234, <2> 58.6234, <3> 58.6234, <4> 58.6234, <5> 58.6234, <6> 58.6234;

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
