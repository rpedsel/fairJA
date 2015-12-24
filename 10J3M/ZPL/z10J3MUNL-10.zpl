set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.3411, <2> 19.3379, <3> 7.4082, <4> 16.9559, <5> 5.045, <6> 15.7843, <7> 46.1513, <8> 40.1929, <9> 43.698, <10> 24.6609;
param workload[JOB] := <1> 15.3411, <2> 19.3379, <3> 7.4082, <4> 16.9559, <5> 5.045, <6> 15.7843, <7> 46.1513, <8> 40.1929, <9> 43.698, <10> 24.6609;
param capacity[MACHINE] := <1> 234.5755, <2> 234.5755, <3> 234.5755;

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
