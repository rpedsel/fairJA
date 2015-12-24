set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.778, <2> 23.6028, <3> 25.0448, <4> 24.2931, <5> 19.5234, <6> 20.769, <7> 31.0701, <8> 24.9298, <9> 19.4948, <10> 28.5449;
param workload[JOB] := <1> 28.778, <2> 23.6028, <3> 25.0448, <4> 24.2931, <5> 19.5234, <6> 20.769, <7> 31.0701, <8> 24.9298, <9> 19.4948, <10> 28.5449;
param capacity[MACHINE] := <1> 82.0169, <2> 82.0169, <3> 82.0169;

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
