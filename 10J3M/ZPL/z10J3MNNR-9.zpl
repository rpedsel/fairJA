set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.6663, <2> 21.1038, <3> 27.1467, <4> 23.0645, <5> 25.6425, <6> 22.6536, <7> 27.283, <8> 21.6887, <9> 22.9537, <10> 20.6743;
param workload[JOB] := <1> 24.8392, <2> 49.2581, <3> 44.2335, <4> 27.6622, <5> 31.4025, <6> 49.2772, <7> 13.2388, <8> 42.2467, <9> 43.92, <10> 48.0643;
param capacity[MACHINE] := <1> 374.1425, <2> 374.1425, <3> 374.1425;

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
