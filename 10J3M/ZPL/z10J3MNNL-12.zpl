set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.75, <2> 24.3191, <3> 26.5592, <4> 18.4352, <5> 24.2367, <6> 29.0703, <7> 32.0294, <8> 21.9209, <9> 29.3365, <10> 23.3698;
param workload[JOB] := <1> 23.75, <2> 24.3191, <3> 26.5592, <4> 18.4352, <5> 24.2367, <6> 29.0703, <7> 32.0294, <8> 21.9209, <9> 29.3365, <10> 23.3698;
param capacity[MACHINE] := <1> 253.0271, <2> 253.0271, <3> 253.0271;

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
