set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.6418, <2> 21.5863, <3> 19.1863, <4> 19.6185, <5> 12.1046, <6> 48.5399, <7> 48.5573, <8> 33.9926, <9> 8.8267, <10> 14.1641;
param workload[JOB] := <1> 43.6418, <2> 21.5863, <3> 19.1863, <4> 19.6185, <5> 12.1046, <6> 48.5399, <7> 48.5573, <8> 33.9926, <9> 8.8267, <10> 14.1641;
param capacity[MACHINE] := <1> 67.5545, <2> 67.5545, <3> 67.5545;

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
