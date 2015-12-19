set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9975, <2> 33.3319, <3> 23.2943, <4> 30.3407, <5> 23.1818, <6> 24.8545, <7> 24.6671, <8> 29.5108, <9> 23.9467, <10> 27.6612;
param workload[JOB] := <1> 27.9975, <2> 33.3319, <3> 23.2943, <4> 30.3407, <5> 23.1818, <6> 24.8545, <7> 24.6671, <8> 29.5108, <9> 23.9467, <10> 27.6612;
param capacity[MACHINE] := <1> 67.1966, <2> 67.1966, <3> 67.1966;

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
