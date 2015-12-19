set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.9272, <2> 2.8286, <3> 34.2937, <4> 24.4817, <5> 2.3378, <6> 22.9607, <7> 12.55, <8> 38.4757, <9> 34.0194, <10> 48.9137;
param workload[JOB] := <1> 6.3528, <2> 6.2262, <3> 6.0749, <4> 0.3195, <5> 4.6488, <6> 27.7692, <7> 42.1389, <8> 39.0368, <9> 28.1059, <10> 49.013;
param capacity[MACHINE] := <1> 209.686, <2> 209.686, <3> 209.686;

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
