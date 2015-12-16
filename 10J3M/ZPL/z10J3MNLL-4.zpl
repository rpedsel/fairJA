set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.8103, <2> 22.9323, <3> 22.3908, <4> 26.9625, <5> 22.4411, <6> 29.4446, <7> 22.9679, <8> 21.9794, <9> 26.6399, <10> 22.0603;
param workload[JOB] := <1> 19.8103, <2> 22.9323, <3> 22.3908, <4> 26.9625, <5> 22.4411, <6> 29.4446, <7> 22.9679, <8> 21.9794, <9> 26.6399, <10> 22.0603;
param capacity[MACHINE] := <1> 79.2097, <2> 79.2097, <3> 79.2097;

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
