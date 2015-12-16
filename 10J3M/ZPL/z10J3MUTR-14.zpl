set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.644, <2> 6.8732, <3> 36.29, <4> 39.4488, <5> 45.5509, <6> 25.6492, <7> 17.1003, <8> 47.0772, <9> 45.043, <10> 3.2487;
param workload[JOB] := <1> 14.3295, <2> 17.86, <3> 37.9642, <4> 15.9948, <5> 11.3562, <6> 30.2509, <7> 11.7509, <8> 18.9594, <9> 6.1095, <10> 10.31;
param capacity[MACHINE] := <1> 43.7213, <2> 43.7213, <3> 43.7213;

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
