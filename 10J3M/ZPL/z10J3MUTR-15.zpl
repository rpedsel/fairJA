set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.6465, <2> 20.4891, <3> 29.9106, <4> 7.607, <5> 13.141, <6> 49.703, <7> 3.5979, <8> 48.2161, <9> 39.4543, <10> 38.8285;
param workload[JOB] := <1> 30.9493, <2> 36.0672, <3> 16.8229, <4> 33.2782, <5> 16.4241, <6> 20.9716, <7> 42.2656, <8> 16.2453, <9> 21.1358, <10> 27.7818;
param capacity[MACHINE] := <1> 65.4854, <2> 65.4854, <3> 65.4854;

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
