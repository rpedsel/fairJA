set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.0218, <2> 37.9191, <3> 38.1936, <4> 6.8689, <5> 25.2292, <6> 4.6693, <7> 24.0244, <8> 2.1037, <9> 10.918, <10> 36.5261;
param workload[JOB] := <1> 24.0218, <2> 37.9191, <3> 38.1936, <4> 6.8689, <5> 25.2292, <6> 4.6693, <7> 24.0244, <8> 2.1037, <9> 10.918, <10> 36.5261;
param capacity[MACHINE] := <1> 210.4741, <2> 210.4741, <3> 210.4741;

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
