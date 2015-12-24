set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.3232, <2> 49.726, <3> 39.5492, <4> 49.1284, <5> 43.8861, <6> 42.1693, <7> 29.774, <8> 31.3837, <9> 36.2669, <10> 49.4748;
param workload[JOB] := <1> 3.213, <2> 7.0517, <3> 6.2888, <4> 7.0092, <5> 6.6247, <6> 6.4938, <7> 5.4566, <8> 5.6021, <9> 6.0222, <10> 7.0338;
param capacity[MACHINE] := <1> 20.2653, <2> 20.2653, <3> 20.2653;

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
