set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.8121, <2> 24.0076, <3> 31.3875, <4> 19.825, <5> 21.9115, <6> 29.3278, <7> 21.1573, <8> 34.5616, <9> 28.2581, <10> 21.8273;
param workload[JOB] := <1> 27.8121, <2> 24.0076, <3> 31.3875, <4> 19.825, <5> 21.9115, <6> 29.3278, <7> 21.1573, <8> 34.5616, <9> 28.2581, <10> 21.8273;
param capacity[MACHINE] := <1> 65.0189, <2> 65.0189, <3> 65.0189;

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
