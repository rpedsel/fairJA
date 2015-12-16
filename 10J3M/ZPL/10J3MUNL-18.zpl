set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.2777, <2> 18.212, <3> 7.9203, <4> 30.5091, <5> 45.8951, <6> 9.7425, <7> 43.5358, <8> 19.6899, <9> 39.6573, <10> 5.1301;
param workload[JOB] := <1> 22.2777, <2> 18.212, <3> 7.9203, <4> 30.5091, <5> 45.8951, <6> 9.7425, <7> 43.5358, <8> 19.6899, <9> 39.6573, <10> 5.1301;
param capacity[MACHINE] := <1> 242.5698, <2> 242.5698, <3> 242.5698;

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
