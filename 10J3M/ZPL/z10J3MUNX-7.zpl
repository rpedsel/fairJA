set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.5755, <2> 32.3432, <3> 23.4288, <4> 41.6395, <5> 14.4589, <6> 1.9603, <7> 5.1013, <8> 45.3242, <9> 20.6734, <10> 42.7693;
param workload[JOB] := <1> 4.9574, <2> 5.6871, <3> 4.8403, <4> 6.4529, <5> 3.8025, <6> 1.4001, <7> 2.2586, <8> 6.7323, <9> 4.5468, <10> 6.5398;
param capacity[MACHINE] := <1> 47.2178, <2> 47.2178, <3> 47.2178;

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
