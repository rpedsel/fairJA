set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.7478, <2> 25.312, <3> 23.2463, <4> 30.3663, <5> 19.2161, <6> 24.8848, <7> 23.6867, <8> 23.6827, <9> 19.4036, <10> 29.3297;
param workload[JOB] := <1> 612.4536, <2> 640.6973, <3> 540.3905, <4> 922.1122, <5> 369.2585, <6> 619.2533, <7> 561.0598, <8> 560.8703, <9> 376.4997, <10> 860.2313;
param capacity[MACHINE] := <1> 1515.7067, <2> 1515.7067, <3> 1515.7067;

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
