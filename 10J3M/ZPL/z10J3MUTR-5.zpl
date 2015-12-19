set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.8938, <2> 31.4674, <3> 41.7198, <4> 37.8143, <5> 3.21, <6> 35.8541, <7> 4.5349, <8> 4.3586, <9> 42.3319, <10> 22.1234;
param workload[JOB] := <1> 39.2223, <2> 34.2864, <3> 13.6811, <4> 38.1108, <5> 35.5428, <6> 11.6506, <7> 4.1188, <8> 31.0488, <9> 47.9772, <10> 25.7918;
param capacity[MACHINE] := <1> 70.3576, <2> 70.3576, <3> 70.3576;

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
