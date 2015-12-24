set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.232, <2> 47.343, <3> 18.5524, <4> 23.359, <5> 34.0939, <6> 44.0601, <7> 38.3413, <8> 32.9054, <9> 1.8806, <10> 7.2772;
param workload[JOB] := <1> 797.0458, <2> 2241.3596, <3> 344.1915, <4> 545.6429, <5> 1162.394, <6> 1941.2924, <7> 1470.0553, <8> 1082.7653, <9> 3.5367, <10> 52.9576;
param capacity[MACHINE] := <1> 3213.747, <2> 3213.747, <3> 3213.747;

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
