set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.4255, <2> 26.7853, <3> 23.3399, <4> 19.4952, <5> 27.03, <6> 29.7932, <7> 27.7306, <8> 23.5093, <9> 26.7615, <10> 23.0873;
param workload[JOB] := <1> 4.1744, <2> 5.1755, <3> 4.8311, <4> 4.4153, <5> 5.199, <6> 5.4583, <7> 5.266, <8> 4.8486, <9> 5.1732, <10> 4.8049;
param capacity[MACHINE] := <1> 49.3463, <2> 49.3463, <3> 49.3463;

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
