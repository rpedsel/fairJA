set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.5683, <2> 30.9698, <3> 23.3663, <4> 17.6495, <5> 23.0077, <6> 31.2845, <7> 30.8116, <8> 20.269, <9> 21.9692, <10> 20.1386;
param workload[JOB] := <1> 40.5546, <2> 28.3656, <3> 37.4891, <4> 13.0876, <5> 27.8871, <6> 40.7961, <7> 39.375, <8> 4.255, <9> 21.4056, <10> 11.4825;
param capacity[MACHINE] := <1> 88.2327, <2> 88.2327, <3> 88.2327;

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
