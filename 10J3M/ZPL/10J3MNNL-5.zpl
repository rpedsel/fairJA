set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.0668, <2> 27.3161, <3> 33.6853, <4> 21.365, <5> 26.6923, <6> 18.1996, <7> 19.0758, <8> 27.7616, <9> 14.7126, <10> 16.9271;
param workload[JOB] := <1> 27.0668, <2> 27.3161, <3> 33.6853, <4> 21.365, <5> 26.6923, <6> 18.1996, <7> 19.0758, <8> 27.7616, <9> 14.7126, <10> 16.9271;
param capacity[MACHINE] := <1> 232.8022, <2> 232.8022, <3> 232.8022;

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
