set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.1262, <2> 29.5208, <3> 29.5638, <4> 29.8736, <5> 25.3902, <6> 29.0397, <7> 28.7186, <8> 25.3545, <9> 25.9804, <10> 27.2514;
param workload[JOB] := <1> 534.8211, <2> 871.4776, <3> 874.0183, <4> 892.432, <5> 644.6623, <6> 843.3042, <7> 824.758, <8> 642.8507, <9> 674.9812, <10> 742.6388;
param capacity[MACHINE] := <1> 2515.3147, <2> 2515.3147, <3> 2515.3147;

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
