set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.6582, <2> 40.653, <3> 35.7476, <4> 21.8279, <5> 22.7667, <6> 27.9712, <7> 23.4841, <8> 37.0958, <9> 45.079, <10> 18.4289;
param workload[JOB] := <1> 3.957, <2> 6.376, <3> 5.9789, <4> 4.672, <5> 4.7714, <6> 5.2888, <7> 4.846, <8> 6.0906, <9> 6.7141, <10> 4.2929;
param capacity[MACHINE] := <1> 17.6626, <2> 17.6626, <3> 17.6626;

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
