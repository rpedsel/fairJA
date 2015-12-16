set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.026, <2> 23.5193, <3> 29.1178, <4> 22.0448, <5> 27.2738, <6> 23.2154, <7> 35.4365, <8> 31.9774, <9> 23.3267, <10> 29.6532;
param workload[JOB] := <1> 28.026, <2> 23.5193, <3> 29.1178, <4> 22.0448, <5> 27.2738, <6> 23.2154, <7> 35.4365, <8> 31.9774, <9> 23.3267, <10> 29.6532;
param capacity[MACHINE] := <1> 68.3978, <2> 68.3978, <3> 68.3978;

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
