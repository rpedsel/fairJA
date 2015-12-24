set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.778, <2> 29.0692, <3> 28.7326, <4> 22.0716, <5> 22.59, <6> 27.1429, <7> 28.4701, <8> 18.0874, <9> 12.6359, <10> 21.5392;
param workload[JOB] := <1> 13.9324, <2> 2.7285, <3> 46.2982, <4> 12.2653, <5> 5.9859, <6> 40.4465, <7> 24.7061, <8> 32.9406, <9> 42.1946, <10> 20.4175;
param capacity[MACHINE] := <1> 241.9156, <2> 241.9156, <3> 241.9156;

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
