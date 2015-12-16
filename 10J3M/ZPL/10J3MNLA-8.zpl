set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7239, <2> 24.8707, <3> 16.6423, <4> 24.6429, <5> 18.9251, <6> 29.3824, <7> 16.3396, <8> 21.9569, <9> 24.8467, <10> 32.2011;
param workload[JOB] := <1> 943.958, <2> 618.5517, <3> 276.9661, <4> 607.2725, <5> 358.1594, <6> 863.3254, <7> 266.9825, <8> 482.1055, <9> 617.3585, <10> 1036.9108;
param capacity[MACHINE] := <1> 2023.8635, <2> 2023.8635, <3> 2023.8635;

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
