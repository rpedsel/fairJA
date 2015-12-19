set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.9573, <2> 14.4224, <3> 36.0214, <4> 13.7993, <5> 21.4498, <6> 43.5164, <7> 3.6359, <8> 21.9289, <9> 39.9036, <10> 38.3209;
param workload[JOB] := <1> 18.0084, <2> 12.5426, <3> 13.6134, <4> 46.4274, <5> 11.278, <6> 34.3766, <7> 23.4285, <8> 48.6045, <9> 8.1924, <10> 20.9676;
param capacity[MACHINE] := <1> 59.3599, <2> 59.3599, <3> 59.3599;

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
