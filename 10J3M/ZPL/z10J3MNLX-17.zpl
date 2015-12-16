set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.1961, <2> 20.4656, <3> 24.942, <4> 14.6301, <5> 33.73, <6> 24.9197, <7> 23.0136, <8> 22.7607, <9> 33.5406, <10> 23.5655;
param workload[JOB] := <1> 4.8162, <2> 4.5239, <3> 4.9942, <4> 3.8249, <5> 5.8078, <6> 4.992, <7> 4.7972, <8> 4.7708, <9> 5.7914, <10> 4.8544;
param capacity[MACHINE] := <1> 16.3909, <2> 16.3909, <3> 16.3909;

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
