set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.8849, <2> 33.8433, <3> 22.4274, <4> 17.145, <5> 22.8208, <6> 23.088, <7> 23.2205, <8> 20.9291, <9> 31.4398, <10> 21.4635;
param workload[JOB] := <1> 23.8849, <2> 33.8433, <3> 22.4274, <4> 17.145, <5> 22.8208, <6> 23.088, <7> 23.2205, <8> 20.9291, <9> 31.4398, <10> 21.4635;
param capacity[MACHINE] := <1> 240.2623, <2> 240.2623, <3> 240.2623;

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
