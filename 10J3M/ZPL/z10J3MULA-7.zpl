set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.7294, <2> 39.4083, <3> 43.3893, <4> 29.2023, <5> 28.5029, <6> 49.8971, <7> 37.7732, <8> 13.4592, <9> 23.2091, <10> 24.382;
param workload[JOB] := <1> 2473.0132, <2> 1553.0141, <3> 1882.6314, <4> 852.7743, <5> 812.4153, <6> 2489.7206, <7> 1426.8146, <8> 181.1501, <9> 538.6623, <10> 594.4819;
param capacity[MACHINE] := <1> 4268.2259, <2> 4268.2259, <3> 4268.2259;

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
