set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.0418, <2> 0.3772, <3> 14.1083, <4> 39.0156, <5> 23.1978, <6> 44.267, <7> 19.4024, <8> 36.2961, <9> 3.1185, <10> 18.6815;
param workload[JOB] := <1> 197.1721, <2> 0.1423, <3> 199.0441, <4> 1522.217, <5> 538.1379, <6> 1959.5673, <7> 376.4531, <8> 1317.4069, <9> 9.725, <10> 348.9984;
param capacity[MACHINE] := <1> 1617.216, <2> 1617.216, <3> 1617.216;

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
