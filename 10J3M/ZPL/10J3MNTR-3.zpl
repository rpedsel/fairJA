set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.105, <2> 16.4007, <3> 26.0135, <4> 24.4301, <5> 20.9025, <6> 16.9229, <7> 28.0548, <8> 28.3161, <9> 23.0495, <10> 31.2216;
param workload[JOB] := <1> 44.9028, <2> 20.6038, <3> 3.0233, <4> 36.1271, <5> 36.5078, <6> 8.3547, <7> 47.8432, <8> 27.2394, <9> 12.0331, <10> 34.9836;
param capacity[MACHINE] := <1> 67.9047, <2> 67.9047, <3> 67.9047;

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
