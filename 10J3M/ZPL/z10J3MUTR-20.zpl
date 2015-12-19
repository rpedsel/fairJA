set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.2616, <2> 19.3785, <3> 21.3566, <4> 33.2576, <5> 26.9174, <6> 11.1463, <7> 37.7266, <8> 6.2869, <9> 21.7207, <10> 30.608;
param workload[JOB] := <1> 0.5333, <2> 19.7827, <3> 13.354, <4> 9.2191, <5> 22.6663, <6> 9.1003, <7> 24.1551, <8> 25.6582, <9> 2.2457, <10> 22.1459;
param capacity[MACHINE] := <1> 37.2151, <2> 37.2151, <3> 37.2151;

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
