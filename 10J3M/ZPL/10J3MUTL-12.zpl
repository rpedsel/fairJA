set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.4576, <2> 7.6882, <3> 6.0672, <4> 8.5329, <5> 14.2144, <6> 22.5494, <7> 31.0449, <8> 16.0995, <9> 36.7547, <10> 2.6698;
param workload[JOB] := <1> 16.4576, <2> 7.6882, <3> 6.0672, <4> 8.5329, <5> 14.2144, <6> 22.5494, <7> 31.0449, <8> 16.0995, <9> 36.7547, <10> 2.6698;
param capacity[MACHINE] := <1> 40.5196, <2> 40.5196, <3> 40.5196;

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
