set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.5759, <2> 22.3709, <3> 30.5425, <4> 24.7402, <5> 22.2327, <6> 21.4247, <7> 28.6098, <8> 20.1491, <9> 16.2026, <10> 20.6837;
param workload[JOB] := <1> 934.8857, <2> 500.4572, <3> 932.8443, <4> 612.0775, <5> 494.2929, <6> 459.0178, <7> 818.5207, <8> 405.9862, <9> 262.5242, <10> 427.8154;
param capacity[MACHINE] := <1> 1462.1055, <2> 1462.1055, <3> 1462.1055;

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
