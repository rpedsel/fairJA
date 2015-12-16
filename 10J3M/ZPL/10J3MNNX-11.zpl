set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.3029, <2> 24.4184, <3> 27.8346, <4> 25.1675, <5> 24.102, <6> 22.3434, <7> 19.6015, <8> 26.8116, <9> 22.3898, <10> 28.0776;
param workload[JOB] := <1> 5.4132, <2> 4.9415, <3> 5.2759, <4> 5.0167, <5> 4.9094, <6> 4.7269, <7> 4.4274, <8> 5.178, <9> 4.7318, <10> 5.2988;
param capacity[MACHINE] := <1> 49.9196, <2> 49.9196, <3> 49.9196;

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
