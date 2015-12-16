set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 36.3309, <2> 32.1067, <3> 48.835, <4> 22.9694, <5> 41.4939, <6> 15.5218, <7> 17.8728, <8> 0.3332, <9> 9.5234, <10> 3.1809;
param workload[JOB] := <1> 1319.9343, <2> 1030.8402, <3> 2384.8572, <4> 527.5933, <5> 1721.7437, <6> 240.9263, <7> 319.437, <8> 0.111, <9> 90.6951, <10> 10.1181;
param capacity[MACHINE] := <1> 2548.7521, <2> 2548.7521, <3> 2548.7521;

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
