set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.5324, <2> 12.8234, <3> 42.1095, <4> 2.7124, <5> 14.4835, <6> 17.9879, <7> 12.3701, <8> 3.9622, <9> 24.1185, <10> 5.6041;
param workload[JOB] := <1> 20.213, <2> 1.6524, <3> 8.0007, <4> 38.5098, <5> 8.7322, <6> 14.5666, <7> 36.2835, <8> 8.8558, <9> 40.6753, <10> 9.6178;
param capacity[MACHINE] := <1> 62.369, <2> 62.369, <3> 62.369;

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
