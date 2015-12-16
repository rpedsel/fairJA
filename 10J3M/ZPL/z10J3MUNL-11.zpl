set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.7076, <2> 16.4927, <3> 21.5942, <4> 21.5017, <5> 3.6683, <6> 20.8605, <7> 48.8249, <8> 0.9831, <9> 5.515, <10> 15.1459;
param workload[JOB] := <1> 10.7076, <2> 16.4927, <3> 21.5942, <4> 21.5017, <5> 3.6683, <6> 20.8605, <7> 48.8249, <8> 0.9831, <9> 5.515, <10> 15.1459;
param capacity[MACHINE] := <1> 165.2939, <2> 165.2939, <3> 165.2939;

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
