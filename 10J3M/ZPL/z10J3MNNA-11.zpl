set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.92, <2> 29.5107, <3> 32.2728, <4> 28.5846, <5> 30.7393, <6> 29.2118, <7> 24.9598, <8> 36.2448, <9> 29.6612, <10> 17.7321;
param workload[JOB] := <1> 895.2064, <2> 870.8814, <3> 1041.5336, <4> 817.0794, <5> 944.9046, <6> 853.3293, <7> 622.9916, <8> 1313.6855, <9> 879.7868, <10> 314.4274;
param capacity[MACHINE] := <1> 8553.826, <2> 8553.826, <3> 8553.826;

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
