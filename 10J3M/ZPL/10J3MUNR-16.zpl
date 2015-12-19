set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.2148, <2> 36.8357, <3> 20.1835, <4> 40.4675, <5> 3.5034, <6> 36.3067, <7> 13.396, <8> 5.0555, <9> 41.2809, <10> 3.6585;
param workload[JOB] := <1> 39.8196, <2> 25.6511, <3> 0.5003, <4> 35.551, <5> 18.7552, <6> 29.5539, <7> 6.1512, <8> 44.1565, <9> 0.4205, <10> 12.212;
param capacity[MACHINE] := <1> 212.7713, <2> 212.7713, <3> 212.7713;

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
