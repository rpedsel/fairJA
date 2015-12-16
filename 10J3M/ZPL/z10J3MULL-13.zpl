set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.7095, <2> 44.1303, <3> 9.511, <4> 45.0035, <5> 29.1219, <6> 19.1852, <7> 14.0666, <8> 31.6842, <9> 38.4534, <10> 38.0592;
param workload[JOB] := <1> 9.7095, <2> 44.1303, <3> 9.511, <4> 45.0035, <5> 29.1219, <6> 19.1852, <7> 14.0666, <8> 31.6842, <9> 38.4534, <10> 38.0592;
param capacity[MACHINE] := <1> 92.9749, <2> 92.9749, <3> 92.9749;

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
