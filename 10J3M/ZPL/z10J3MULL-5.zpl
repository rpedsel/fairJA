set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.5448, <2> 37.8274, <3> 37.9456, <4> 45.3396, <5> 15.326, <6> 33.9097, <7> 17.6222, <8> 16.7444, <9> 1.4405, <10> 42.177;
param workload[JOB] := <1> 11.5448, <2> 37.8274, <3> 37.9456, <4> 45.3396, <5> 15.326, <6> 33.9097, <7> 17.6222, <8> 16.7444, <9> 1.4405, <10> 42.177;
param capacity[MACHINE] := <1> 86.6257, <2> 86.6257, <3> 86.6257;

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
