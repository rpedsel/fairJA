set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2152, <2> 21.665, <3> 29.7764, <4> 25.5295, <5> 18.0492, <6> 32.2926, <7> 18.6557, <8> 25.4426, <9> 20.2666, <10> 24.4326;
param workload[JOB] := <1> 21.2152, <2> 21.665, <3> 29.7764, <4> 25.5295, <5> 18.0492, <6> 32.2926, <7> 18.6557, <8> 25.4426, <9> 20.2666, <10> 24.4326;
param capacity[MACHINE] := <1> 237.3254, <2> 237.3254, <3> 237.3254;

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
