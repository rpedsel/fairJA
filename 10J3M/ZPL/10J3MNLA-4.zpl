set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.494, <2> 23.3943, <3> 30.2697, <4> 23.0945, <5> 20.0528, <6> 27.437, <7> 18.2394, <8> 22.8867, <9> 24.5721, <10> 18.8522;
param workload[JOB] := <1> 599.956, <2> 547.2933, <3> 916.2547, <4> 533.3559, <5> 402.1148, <6> 752.789, <7> 332.6757, <8> 523.801, <9> 603.7881, <10> 355.4054;
param capacity[MACHINE] := <1> 1855.8113, <2> 1855.8113, <3> 1855.8113;

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
