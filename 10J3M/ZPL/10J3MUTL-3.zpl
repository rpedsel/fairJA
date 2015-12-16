set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.3864, <2> 45.8859, <3> 8.3261, <4> 17.9896, <5> 0.5447, <6> 26.2481, <7> 23.5796, <8> 44.312, <9> 12.7555, <10> 46.9837;
param workload[JOB] := <1> 32.3864, <2> 45.8859, <3> 8.3261, <4> 17.9896, <5> 0.5447, <6> 26.2481, <7> 23.5796, <8> 44.312, <9> 12.7555, <10> 46.9837;
param capacity[MACHINE] := <1> 64.7529, <2> 64.7529, <3> 64.7529;

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
