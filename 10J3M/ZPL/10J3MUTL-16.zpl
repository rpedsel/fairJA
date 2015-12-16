set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.0115, <2> 48.5578, <3> 17.357, <4> 0.7889, <5> 0.2984, <6> 1.0476, <7> 26.4947, <8> 40.1737, <9> 28.6111, <10> 13.0584;
param workload[JOB] := <1> 6.0115, <2> 48.5578, <3> 17.357, <4> 0.7889, <5> 0.2984, <6> 1.0476, <7> 26.4947, <8> 40.1737, <9> 28.6111, <10> 13.0584;
param capacity[MACHINE] := <1> 45.5998, <2> 45.5998, <3> 45.5998;

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
