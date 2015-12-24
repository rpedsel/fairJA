set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.1945, <2> 33.9726, <3> 34.0879, <4> 29.1645, <5> 36.5544, <6> 31.8871, <7> 29.2159, <8> 34.797, <9> 23.6248, <10> 27.048;
param workload[JOB] := <1> 28.1945, <2> 33.9726, <3> 34.0879, <4> 29.1645, <5> 36.5544, <6> 31.8871, <7> 29.2159, <8> 34.797, <9> 23.6248, <10> 27.048;
param capacity[MACHINE] := <1> 77.1367, <2> 77.1367, <3> 77.1367;

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
