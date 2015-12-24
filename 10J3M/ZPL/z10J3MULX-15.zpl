set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.332, <2> 27.7805, <3> 30.6429, <4> 4.004, <5> 6.1846, <6> 45.3831, <7> 34.1711, <8> 11.7897, <9> 17.8105, <10> 35.7861;
param workload[JOB] := <1> 3.3663, <2> 5.2707, <3> 5.5356, <4> 2.001, <5> 2.4869, <6> 6.7367, <7> 5.8456, <8> 3.4336, <9> 4.2202, <10> 5.9821;
param capacity[MACHINE] := <1> 14.9596, <2> 14.9596, <3> 14.9596;

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
