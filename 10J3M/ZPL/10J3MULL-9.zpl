set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.6911, <2> 13.4808, <3> 0.8636, <4> 22.3346, <5> 43.3559, <6> 4.143, <7> 25.5156, <8> 41.9053, <9> 9.5965, <10> 10.064;
param workload[JOB] := <1> 36.6911, <2> 13.4808, <3> 0.8636, <4> 22.3346, <5> 43.3559, <6> 4.143, <7> 25.5156, <8> 41.9053, <9> 9.5965, <10> 10.064;
param capacity[MACHINE] := <1> 69.3168, <2> 69.3168, <3> 69.3168;

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
