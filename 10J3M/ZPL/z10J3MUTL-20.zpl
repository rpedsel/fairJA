set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.6503, <2> 9.1429, <3> 28.7654, <4> 45.1201, <5> 4.3601, <6> 44.5437, <7> 41.9582, <8> 32.3771, <9> 9.8108, <10> 21.7308;
param workload[JOB] := <1> 18.6503, <2> 9.1429, <3> 28.7654, <4> 45.1201, <5> 4.3601, <6> 44.5437, <7> 41.9582, <8> 32.3771, <9> 9.8108, <10> 21.7308;
param capacity[MACHINE] := <1> 64.1149, <2> 64.1149, <3> 64.1149;

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
