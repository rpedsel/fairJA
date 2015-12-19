set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9203, <2> 41.3181, <3> 0.0447, <4> 43.4514, <5> 10.37, <6> 9.6749, <7> 48.9727, <8> 36.0478, <9> 14.8311, <10> 5.7927;
param workload[JOB] := <1> 45.9369, <2> 21.2063, <3> 12.7009, <4> 35.464, <5> 42.9448, <6> 1.9223, <7> 43.9167, <8> 4.0581, <9> 47.4541, <10> 19.7524;
param capacity[MACHINE] := <1> 68.8391, <2> 68.8391, <3> 68.8391;

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
