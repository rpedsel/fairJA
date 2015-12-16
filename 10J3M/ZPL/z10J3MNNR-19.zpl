set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8779, <2> 29.5072, <3> 24.4609, <4> 20.0684, <5> 25.8516, <6> 16.8938, <7> 29.4577, <8> 31.9007, <9> 21.0184, <10> 31.8156;
param workload[JOB] := <1> 23.9958, <2> 36.8257, <3> 43.2707, <4> 40.9751, <5> 9.8895, <6> 25.0649, <7> 38.8777, <8> 17.5937, <9> 48.7697, <10> 49.4405;
param capacity[MACHINE] := <1> 334.7033, <2> 334.7033, <3> 334.7033;

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
