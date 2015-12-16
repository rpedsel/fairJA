set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.1751, <2> 18.9969, <3> 21.4266, <4> 33.5099, <5> 12.9201, <6> 10.4316, <7> 21.8576, <8> 49.47, <9> 43.3036, <10> 42.4888;
param workload[JOB] := <1> 6.5708, <2> 4.3585, <3> 4.6289, <4> 5.7888, <5> 3.5945, <6> 3.2298, <7> 4.6752, <8> 7.0335, <9> 6.5805, <10> 6.5183;
param capacity[MACHINE] := <1> 17.6596, <2> 17.6596, <3> 17.6596;

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
