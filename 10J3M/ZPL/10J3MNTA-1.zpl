set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.5702, <2> 25.5417, <3> 28.5089, <4> 24.1966, <5> 24.4339, <6> 27.6779, <7> 21.6267, <8> 20.1095, <9> 27.7629, <10> 26.6459;
param workload[JOB] := <1> 760.1159, <2> 652.3784, <3> 812.7574, <4> 585.4755, <5> 597.0155, <6> 766.0661, <7> 467.7142, <8> 404.392, <9> 770.7786, <10> 710.004;
param capacity[MACHINE] := <1> 1631.6744, <2> 1631.6744, <3> 1631.6744;

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
