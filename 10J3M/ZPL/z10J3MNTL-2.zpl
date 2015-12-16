set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.0069, <2> 24.0355, <3> 26.8102, <4> 30.6314, <5> 24.9923, <6> 22.2411, <7> 23.6437, <8> 23.5591, <9> 34.3076, <10> 28.4895;
param workload[JOB] := <1> 28.0069, <2> 24.0355, <3> 26.8102, <4> 30.6314, <5> 24.9923, <6> 22.2411, <7> 23.6437, <8> 23.5591, <9> 34.3076, <10> 28.4895;
param capacity[MACHINE] := <1> 66.6793, <2> 66.6793, <3> 66.6793;

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
