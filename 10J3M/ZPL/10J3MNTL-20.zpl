set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.109, <2> 23.3804, <3> 24.1314, <4> 24.8701, <5> 30.1702, <6> 37.3164, <7> 29.4787, <8> 26.9871, <9> 30.9276, <10> 27.3337;
param workload[JOB] := <1> 23.109, <2> 23.3804, <3> 24.1314, <4> 24.8701, <5> 30.1702, <6> 37.3164, <7> 29.4787, <8> 26.9871, <9> 30.9276, <10> 27.3337;
param capacity[MACHINE] := <1> 69.4262, <2> 69.4262, <3> 69.4262;

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
