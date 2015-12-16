set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.0884, <2> 42.1916, <3> 33.5313, <4> 38.1611, <5> 11.9425, <6> 26.8875, <7> 24.8151, <8> 11.048, <9> 17.5688, <10> 24.1525;
param workload[JOB] := <1> 1.0884, <2> 42.1916, <3> 33.5313, <4> 38.1611, <5> 11.9425, <6> 26.8875, <7> 24.8151, <8> 11.048, <9> 17.5688, <10> 24.1525;
param capacity[MACHINE] := <1> 77.1289, <2> 77.1289, <3> 77.1289;

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
