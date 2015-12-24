set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.3528, <2> 28.2539, <3> 29.8938, <4> 21.3677, <5> 24.5289, <6> 22.5075, <7> 25.8454, <8> 18.1599, <9> 28.4151, <10> 19.5343;
param workload[JOB] := <1> 26.3528, <2> 28.2539, <3> 29.8938, <4> 21.3677, <5> 24.5289, <6> 22.5075, <7> 25.8454, <8> 18.1599, <9> 28.4151, <10> 19.5343;
param capacity[MACHINE] := <1> 61.2148, <2> 61.2148, <3> 61.2148;

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
