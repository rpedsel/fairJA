set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0563, <2> 24.2996, <3> 26.3313, <4> 13.0248, <5> 28.7506, <6> 25.9103, <7> 26.3594, <8> 34.124, <9> 15.9073, <10> 25.8187;
param workload[JOB] := <1> 24.0563, <2> 24.2996, <3> 26.3313, <4> 13.0248, <5> 28.7506, <6> 25.9103, <7> 26.3594, <8> 34.124, <9> 15.9073, <10> 25.8187;
param capacity[MACHINE] := <1> 81.5274, <2> 81.5274, <3> 81.5274;

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
