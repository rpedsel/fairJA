set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.8675, <2> 32.8287, <3> 18.9511, <4> 21.3809, <5> 3.3039, <6> 17.051, <7> 45.1659, <8> 8.9866, <9> 28.2157, <10> 14.2041;
param workload[JOB] := <1> 1589.4176, <2> 1077.7235, <3> 359.1442, <4> 457.1429, <5> 10.9158, <6> 290.7366, <7> 2039.9585, <8> 80.759, <9> 796.1257, <10> 201.7565;
param capacity[MACHINE] := <1> 6903.6803, <2> 6903.6803, <3> 6903.6803;

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
