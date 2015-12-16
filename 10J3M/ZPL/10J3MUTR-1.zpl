set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.9935, <2> 47.5734, <3> 27.0925, <4> 42.1368, <5> 8.2298, <6> 20.9676, <7> 20.3873, <8> 20.2874, <9> 19.4044, <10> 4.606;
param workload[JOB] := <1> 27.2054, <2> 3.5746, <3> 33.4306, <4> 10.1176, <5> 38.9485, <6> 11.2238, <7> 36.366, <8> 40.4405, <9> 1.1283, <10> 2.2509;
param capacity[MACHINE] := <1> 51.1715, <2> 51.1715, <3> 51.1715;

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
