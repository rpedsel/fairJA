set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.343, <2> 25.1322, <3> 34.159, <4> 13.3663, <5> 28.5425, <6> 45.0844, <7> 44.5847, <8> 43.9753, <9> 20.2928, <10> 25.3331;
param workload[JOB] := <1> 4.7268, <2> 5.0132, <3> 5.8446, <4> 3.656, <5> 5.3425, <6> 6.7145, <7> 6.6772, <8> 6.6314, <9> 4.5048, <10> 5.0332;
param capacity[MACHINE] := <1> 18.0481, <2> 18.0481, <3> 18.0481;

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
