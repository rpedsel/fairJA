set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7291, <2> 17.6729, <3> 28.0365, <4> 24.5949, <5> 27.0276, <6> 30.5083, <7> 20.7325, <8> 24.6528, <9> 19.5316, <10> 29.0013;
param workload[JOB] := <1> 5.0724, <2> 4.2039, <3> 5.295, <4> 4.9593, <5> 5.1988, <6> 5.5234, <7> 4.5533, <8> 4.9652, <9> 4.4195, <10> 5.3853;
param capacity[MACHINE] := <1> 12.3941, <2> 12.3941, <3> 12.3941;

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
