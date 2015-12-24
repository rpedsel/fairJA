set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.9066, <2> 0.6866, <3> 24.7249, <4> 27.2156, <5> 24.2178, <6> 47.5852, <7> 41.2504, <8> 5.434, <9> 16.7422, <10> 25.878;
param workload[JOB] := <1> 17.1387, <2> 24.0865, <3> 16.1948, <4> 15.7692, <5> 22.6684, <6> 39.5303, <7> 34.4268, <8> 34.4407, <9> 37.4954, <10> 33.6363;
param capacity[MACHINE] := <1> 91.7957, <2> 91.7957, <3> 91.7957;

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
