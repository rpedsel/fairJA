set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.9082, <2> 33.0091, <3> 16.0419, <4> 37.7939, <5> 13.3972, <6> 33.9083, <7> 6.596, <8> 26.9238, <9> 48.7357, <10> 13.1325;
param workload[JOB] := <1> 18.9082, <2> 33.0091, <3> 16.0419, <4> 37.7939, <5> 13.3972, <6> 33.9083, <7> 6.596, <8> 26.9238, <9> 48.7357, <10> 13.1325;
param capacity[MACHINE] := <1> 82.8155, <2> 82.8155, <3> 82.8155;

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
