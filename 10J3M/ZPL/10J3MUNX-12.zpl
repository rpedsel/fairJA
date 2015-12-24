set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.7714, <2> 18.4519, <3> 29.073, <4> 37.7028, <5> 12.771, <6> 1.0869, <7> 46.6301, <8> 17.3309, <9> 20.5063, <10> 20.257;
param workload[JOB] := <1> 1.942, <2> 4.2956, <3> 5.3919, <4> 6.1403, <5> 3.5737, <6> 1.0425, <7> 6.8286, <8> 4.163, <9> 4.5284, <10> 4.5008;
param capacity[MACHINE] := <1> 42.4068, <2> 42.4068, <3> 42.4068;

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
