set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.0217, <2> 26.0321, <3> 5.7895, <4> 10.6744, <5> 42.0435, <6> 17.4204, <7> 23.7273, <8> 7.8309, <9> 38.8248, <10> 7.9605;
param workload[JOB] := <1> 20.0949, <2> 47.8892, <3> 5.0825, <4> 39.1432, <5> 18.731, <6> 6.6331, <7> 21.1165, <8> 38.7196, <9> 47.5587, <10> 35.9114;
param capacity[MACHINE] := <1> 93.6267, <2> 93.6267, <3> 93.6267;

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
