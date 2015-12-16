set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.1941, <2> 20.9036, <3> 23.1895, <4> 27.4925, <5> 22.6245, <6> 13.1658, <7> 17.4074, <8> 23.7269, <9> 29.2951, <10> 16.856;
param workload[JOB] := <1> 16.1941, <2> 20.9036, <3> 23.1895, <4> 27.4925, <5> 22.6245, <6> 13.1658, <7> 17.4074, <8> 23.7269, <9> 29.2951, <10> 16.856;
param capacity[MACHINE] := <1> 210.8554, <2> 210.8554, <3> 210.8554;

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
