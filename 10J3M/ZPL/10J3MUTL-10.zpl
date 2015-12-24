set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.7491, <2> 18.8509, <3> 20.4884, <4> 47.1193, <5> 40.8173, <6> 0.5695, <7> 48.705, <8> 16.9536, <9> 40.638, <10> 0.6548;
param workload[JOB] := <1> 8.7491, <2> 18.8509, <3> 20.4884, <4> 47.1193, <5> 40.8173, <6> 0.5695, <7> 48.705, <8> 16.9536, <9> 40.638, <10> 0.6548;
param capacity[MACHINE] := <1> 60.8865, <2> 60.8865, <3> 60.8865;

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
