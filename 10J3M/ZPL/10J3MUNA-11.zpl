set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.5784, <2> 17.0435, <3> 18.3248, <4> 34.766, <5> 28.3052, <6> 10.0219, <7> 48.7127, <8> 17.1663, <9> 7.034, <10> 36.9892;
param workload[JOB] := <1> 874.8817, <2> 290.4809, <3> 335.7983, <4> 1208.6748, <5> 801.1843, <6> 100.4385, <7> 2372.9271, <8> 294.6819, <9> 49.4772, <10> 1368.2009;
param capacity[MACHINE] := <1> 7696.7456, <2> 7696.7456, <3> 7696.7456;

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
