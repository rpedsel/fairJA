set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.433, <2> 28.8959, <3> 13.5063, <4> 26.4825, <5> 11.8043, <6> 23.9913, <7> 21.365, <8> 20.598, <9> 22.5179, <10> 20.0912;
param workload[JOB] := <1> 4.6296, <2> 5.3755, <3> 3.6751, <4> 5.1461, <5> 3.4357, <6> 4.8981, <7> 4.6222, <8> 4.5385, <9> 4.7453, <10> 4.4823;
param capacity[MACHINE] := <1> 11.3871, <2> 11.3871, <3> 11.3871;

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
