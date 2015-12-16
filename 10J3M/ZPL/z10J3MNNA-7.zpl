set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.1609, <2> 29.557, <3> 25.9623, <4> 23.8772, <5> 22.2977, <6> 19.2122, <7> 24.6719, <8> 19.2361, <9> 34.4278, <10> 18.9276;
param workload[JOB] := <1> 1380.9325, <2> 873.6162, <3> 674.041, <4> 570.1207, <5> 497.1874, <6> 369.1086, <7> 608.7026, <8> 370.0275, <9> 1185.2734, <10> 358.254;
param capacity[MACHINE] := <1> 6887.2639, <2> 6887.2639, <3> 6887.2639;

var x[JM] binary;
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
