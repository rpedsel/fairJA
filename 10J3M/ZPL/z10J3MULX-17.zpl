set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.5056, <2> 26.6623, <3> 4.3424, <4> 45.0432, <5> 38.9658, <6> 5.4973, <7> 1.2622, <8> 12.1913, <9> 41.5416, <10> 43.0698;
param workload[JOB] := <1> 4.184, <2> 5.1636, <3> 2.0838, <4> 6.7114, <5> 6.2423, <6> 2.3446, <7> 1.1235, <8> 3.4916, <9> 6.4453, <10> 6.5628;
param capacity[MACHINE] := <1> 14.7843, <2> 14.7843, <3> 14.7843;

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
