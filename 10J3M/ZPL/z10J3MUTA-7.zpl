set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.3667, <2> 19.6024, <3> 10.7533, <4> 48.5428, <5> 22.2481, <6> 10.6827, <7> 0.0886, <8> 19.4197, <9> 2.1276, <10> 8.4953;
param workload[JOB] := <1> 2058.1375, <2> 384.2541, <3> 115.6335, <4> 2356.4034, <5> 494.978, <6> 114.1201, <7> 0.0078, <8> 377.1247, <9> 4.5267, <10> 72.1701;
param capacity[MACHINE] := <1> 2643.1834, <2> 2643.1834, <3> 2643.1834;

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
