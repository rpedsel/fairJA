set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.7206, <2> 9.8086, <3> 29.3856, <4> 19.2517, <5> 28.4657, <6> 44.53, <7> 40.5621, <8> 48.572, <9> 35.0774, <10> 45.0615;
param workload[JOB] := <1> 6.8352, <2> 3.1319, <3> 5.4208, <4> 4.3877, <5> 5.3353, <6> 6.6731, <7> 6.3688, <8> 6.9694, <9> 5.9226, <10> 6.7128;
param capacity[MACHINE] := <1> 19.2525, <2> 19.2525, <3> 19.2525;

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
