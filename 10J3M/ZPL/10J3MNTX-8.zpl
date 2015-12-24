set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.7931, <2> 24.046, <3> 29.9541, <4> 23.9267, <5> 21.61, <6> 25.1496, <7> 33.637, <8> 28.3262, <9> 24.093, <10> 23.9181;
param workload[JOB] := <1> 4.9793, <2> 4.9037, <3> 5.473, <4> 4.8915, <5> 4.6487, <6> 5.0149, <7> 5.7997, <8> 5.3222, <9> 4.9085, <10> 4.8906;
param capacity[MACHINE] := <1> 12.708, <2> 12.708, <3> 12.708;

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
