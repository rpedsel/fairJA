set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.7945, <2> 4.2239, <3> 15.5674, <4> 17.2571, <5> 18.2582, <6> 26.4169, <7> 24.3028, <8> 10.517, <9> 18.1731, <10> 9.8553;
param workload[JOB] := <1> 5.8133, <2> 2.0552, <3> 3.9456, <4> 4.1542, <5> 4.273, <6> 5.1397, <7> 4.9298, <8> 3.243, <9> 4.263, <10> 3.1393;
param capacity[MACHINE] := <1> 40.9561, <2> 40.9561, <3> 40.9561;

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
