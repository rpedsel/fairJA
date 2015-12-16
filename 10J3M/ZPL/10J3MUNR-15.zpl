set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.229, <2> 46.0701, <3> 28.1937, <4> 40.9962, <5> 49.856, <6> 45.6021, <7> 21.2605, <8> 14.622, <9> 18.2196, <10> 27.4375;
param workload[JOB] := <1> 45.9592, <2> 0.683, <3> 32.765, <4> 11.4151, <5> 26.7959, <6> 38.6839, <7> 23.5258, <8> 35.5079, <9> 6.3495, <10> 20.1432;
param capacity[MACHINE] := <1> 241.8285, <2> 241.8285, <3> 241.8285;

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
