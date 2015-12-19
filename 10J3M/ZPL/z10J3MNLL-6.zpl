set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0248, <2> 17.2319, <3> 20.8432, <4> 29.9191, <5> 20.4986, <6> 31.3408, <7> 27.238, <8> 29.7031, <9> 23.5039, <10> 30.1214;
param workload[JOB] := <1> 22.0248, <2> 17.2319, <3> 20.8432, <4> 29.9191, <5> 20.4986, <6> 31.3408, <7> 27.238, <8> 29.7031, <9> 23.5039, <10> 30.1214;
param capacity[MACHINE] := <1> 84.1416, <2> 84.1416, <3> 84.1416;

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
