set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2468, <2> 46.6017, <3> 22.575, <4> 16.5874, <5> 16.2961, <6> 1.3496, <7> 42.4796, <8> 10.3854, <9> 0.6319, <10> 40.2294;
param workload[JOB] := <1> 33.2745, <2> 0.7136, <3> 37.5021, <4> 47.9808, <5> 29.6626, <6> 45.0629, <7> 1.8396, <8> 0.4393, <9> 21.644, <10> 37.0628;
param capacity[MACHINE] := <1> 85.0607, <2> 85.0607, <3> 85.0607;

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
