set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.1565, <2> 23.9906, <3> 25.9771, <4> 19.2335, <5> 33.0122, <6> 45.9222, <7> 17.9651, <8> 48.1421, <9> 47.0851, <10> 47.0665;
param workload[JOB] := <1> 4.4932, <2> 34.6622, <3> 18.66, <4> 39.1655, <5> 36.3532, <6> 42.2729, <7> 31.9125, <8> 42.8887, <9> 5.2255, <10> 27.2759;
param capacity[MACHINE] := <1> 94.3032, <2> 94.3032, <3> 94.3032;

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
