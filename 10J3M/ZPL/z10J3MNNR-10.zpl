set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.6241, <2> 18.1049, <3> 26.888, <4> 32.439, <5> 41.0212, <6> 30.7354, <7> 19.0904, <8> 31.9019, <9> 32.0792, <10> 26.8641;
param workload[JOB] := <1> 45.4279, <2> 2.3037, <3> 22.4343, <4> 11.1938, <5> 1.176, <6> 46.928, <7> 15.5995, <8> 29.0171, <9> 24.8247, <10> 12.9178;
param capacity[MACHINE] := <1> 211.8228, <2> 211.8228, <3> 211.8228;

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
