set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.28, <2> 31.965, <3> 32.3763, <4> 29.3351, <5> 34.2657, <6> 1.8842, <7> 2.1368, <8> 36.3638, <9> 34.0332, <10> 17.9791;
param workload[JOB] := <1> 11.28, <2> 31.965, <3> 32.3763, <4> 29.3351, <5> 34.2657, <6> 1.8842, <7> 2.1368, <8> 36.3638, <9> 34.0332, <10> 17.9791;
param capacity[MACHINE] := <1> 77.2064, <2> 77.2064, <3> 77.2064;

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
