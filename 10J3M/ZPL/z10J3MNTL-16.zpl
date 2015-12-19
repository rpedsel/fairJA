set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.5825, <2> 31.4686, <3> 14.7022, <4> 23.47, <5> 26.6428, <6> 24.3326, <7> 25.3101, <8> 17.5956, <9> 32.1205, <10> 25.8587;
param workload[JOB] := <1> 26.5825, <2> 31.4686, <3> 14.7022, <4> 23.47, <5> 26.6428, <6> 24.3326, <7> 25.3101, <8> 17.5956, <9> 32.1205, <10> 25.8587;
param capacity[MACHINE] := <1> 62.0209, <2> 62.0209, <3> 62.0209;

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
