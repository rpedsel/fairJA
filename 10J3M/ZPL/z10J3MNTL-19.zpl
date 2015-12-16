set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0863, <2> 25.8167, <3> 32.8356, <4> 27.0162, <5> 33.824, <6> 27.7636, <7> 34.2634, <8> 30.5232, <9> 18.5041, <10> 26.6591;
param workload[JOB] := <1> 32.0863, <2> 25.8167, <3> 32.8356, <4> 27.0162, <5> 33.824, <6> 27.7636, <7> 34.2634, <8> 30.5232, <9> 18.5041, <10> 26.6591;
param capacity[MACHINE] := <1> 72.323, <2> 72.323, <3> 72.323;

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
