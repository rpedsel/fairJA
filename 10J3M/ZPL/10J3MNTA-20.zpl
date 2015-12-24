set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.5256, <2> 21.4315, <3> 25.1455, <4> 26.9927, <5> 27.1536, <6> 29.4669, <7> 28.9916, <8> 27.0616, <9> 21.2901, <10> 17.6127;
param workload[JOB] := <1> 381.2491, <2> 459.3092, <3> 632.2962, <4> 728.6059, <5> 737.318, <6> 868.2982, <7> 840.5129, <8> 732.3302, <9> 453.2684, <10> 310.2072;
param capacity[MACHINE] := <1> 1535.8488, <2> 1535.8488, <3> 1535.8488;

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
