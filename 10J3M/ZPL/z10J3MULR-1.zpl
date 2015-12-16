set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.6288, <2> 14.8048, <3> 20.275, <4> 14.3668, <5> 17.8075, <6> 23.0698, <7> 29.6028, <8> 48.4193, <9> 39.6658, <10> 38.5533;
param workload[JOB] := <1> 11.6994, <2> 47.2662, <3> 0.4369, <4> 24.4517, <5> 20.2625, <6> 20.0581, <7> 29.7798, <8> 37.9156, <9> 36.7182, <10> 12.8921;
param capacity[MACHINE] := <1> 80.4935, <2> 80.4935, <3> 80.4935;

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
