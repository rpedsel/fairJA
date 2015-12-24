set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.7003, <2> 4.2786, <3> 18.3775, <4> 22.9543, <5> 43.6278, <6> 7.208, <7> 8.6616, <8> 1.2791, <9> 7.029, <10> 38.2247;
param workload[JOB] := <1> 42.7003, <2> 4.2786, <3> 18.3775, <4> 22.9543, <5> 43.6278, <6> 7.208, <7> 8.6616, <8> 1.2791, <9> 7.029, <10> 38.2247;
param capacity[MACHINE] := <1> 48.5852, <2> 48.5852, <3> 48.5852;

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
