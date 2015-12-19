set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.7668, <2> 39.1482, <3> 39.1613, <4> 28.8956, <5> 34.1455, <6> 22.4469, <7> 1.4432, <8> 42.6423, <9> 8.5853, <10> 13.1913;
param workload[JOB] := <1> 1.3292, <2> 6.2569, <3> 6.2579, <4> 5.3755, <5> 5.8434, <6> 4.7378, <7> 1.2013, <8> 6.5301, <9> 2.9301, <10> 3.632;
param capacity[MACHINE] := <1> 14.6981, <2> 14.6981, <3> 14.6981;

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
