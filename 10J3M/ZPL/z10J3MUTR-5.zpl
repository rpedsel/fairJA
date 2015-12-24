set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.4936, <2> 3.1942, <3> 10.3775, <4> 32.0421, <5> 29.1265, <6> 38.2186, <7> 10.2113, <8> 27.4695, <9> 24.7453, <10> 32.6361;
param workload[JOB] := <1> 14.7029, <2> 45.0226, <3> 9.4091, <4> 33.3811, <5> 16.126, <6> 38.6928, <7> 19.5144, <8> 9.7335, <9> 35.7669, <10> 8.0365;
param capacity[MACHINE] := <1> 57.5965, <2> 57.5965, <3> 57.5965;

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
