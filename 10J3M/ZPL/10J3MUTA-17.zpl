set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.9176, <2> 45.9897, <3> 17.2285, <4> 47.1012, <5> 39.2343, <6> 6.8446, <7> 5.1754, <8> 37.1397, <9> 24.7835, <10> 26.0259;
param workload[JOB] := <1> 222.5348, <2> 2115.0525, <3> 296.8212, <4> 2218.523, <5> 1539.3303, <6> 46.8485, <7> 26.7848, <8> 1379.3573, <9> 614.2219, <10> 677.3475;
param capacity[MACHINE] := <1> 2284.2055, <2> 2284.2055, <3> 2284.2055;

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
