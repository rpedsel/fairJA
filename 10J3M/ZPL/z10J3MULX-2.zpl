set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.3311, <2> 13.5418, <3> 24.9767, <4> 15.059, <5> 41.7171, <6> 48.7581, <7> 35.6761, <8> 44.2137, <9> 28.1748, <10> 48.8918;
param workload[JOB] := <1> 4.8302, <2> 3.6799, <3> 4.9977, <4> 3.8806, <5> 6.4589, <6> 6.9827, <7> 5.9729, <8> 6.6493, <9> 5.308, <10> 6.9923;
param capacity[MACHINE] := <1> 18.5842, <2> 18.5842, <3> 18.5842;

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
