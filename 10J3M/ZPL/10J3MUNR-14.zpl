set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.6885, <2> 25.7036, <3> 31.1359, <4> 28.1019, <5> 25.3008, <6> 31.7374, <7> 15.0832, <8> 28.3925, <9> 35.6038, <10> 30.3734;
param workload[JOB] := <1> 3.9648, <2> 29.6443, <3> 36.5818, <4> 1.822, <5> 26.0491, <6> 34.0064, <7> 46.0604, <8> 8.1189, <9> 40.0971, <10> 44.7182;
param capacity[MACHINE] := <1> 271.063, <2> 271.063, <3> 271.063;

var x[JM];
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
