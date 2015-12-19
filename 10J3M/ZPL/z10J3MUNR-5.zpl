set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.4353, <2> 6.5206, <3> 43.281, <4> 29.5143, <5> 33.5661, <6> 25.5745, <7> 48.9584, <8> 23.8812, <9> 46.5929, <10> 16.4526;
param workload[JOB] := <1> 27.1138, <2> 2.0343, <3> 41.8384, <4> 4.8313, <5> 38.9204, <6> 49.576, <7> 20.2061, <8> 45.1987, <9> 15.6427, <10> 17.7022;
param capacity[MACHINE] := <1> 263.0639, <2> 263.0639, <3> 263.0639;

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
