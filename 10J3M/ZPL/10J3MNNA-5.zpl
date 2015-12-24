set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.5178, <2> 27.5238, <3> 28.9026, <4> 27.6465, <5> 30.0029, <6> 23.9879, <7> 22.9163, <8> 24.3281, <9> 31.7919, <10> 24.0842;
param workload[JOB] := <1> 651.1581, <2> 757.5596, <3> 835.3603, <4> 764.329, <5> 900.174, <6> 575.4193, <7> 525.1568, <8> 591.8564, <9> 1010.7249, <10> 580.0487;
param capacity[MACHINE] := <1> 7191.7871, <2> 7191.7871, <3> 7191.7871;

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
