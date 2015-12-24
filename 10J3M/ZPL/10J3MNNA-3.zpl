set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7983, <2> 22.9392, <3> 19.4353, <4> 25.9596, <5> 35.2194, <6> 25.5814, <7> 26.1013, <8> 24.296, <9> 24.7533, <10> 27.55;
param workload[JOB] := <1> 948.5353, <2> 526.2069, <3> 377.7309, <4> 673.9008, <5> 1240.4061, <6> 654.408, <7> 681.2779, <8> 590.2956, <9> 612.7259, <10> 759.0025;
param capacity[MACHINE] := <1> 7064.4899, <2> 7064.4899, <3> 7064.4899;

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
