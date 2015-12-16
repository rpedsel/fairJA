set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.8155, <2> 10.6772, <3> 17.1171, <4> 43.8328, <5> 7.1978, <6> 38.8151, <7> 47.2287, <8> 17.6064, <9> 36.1202, <10> 9.9541;
param workload[JOB] := <1> 38.8155, <2> 10.6772, <3> 17.1171, <4> 43.8328, <5> 7.1978, <6> 38.8151, <7> 47.2287, <8> 17.6064, <9> 36.1202, <10> 9.9541;
param capacity[MACHINE] := <1> 89.1216, <2> 89.1216, <3> 89.1216;

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
