set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.6965, <2> 26.9354, <3> 37.2216, <4> 36.6381, <5> 16.7699, <6> 43.1939, <7> 21.2059, <8> 31.3069, <9> 41.584, <10> 29.2546;
param workload[JOB] := <1> 25.2846, <2> 0.832, <3> 38.637, <4> 27.946, <5> 19.4318, <6> 3.2517, <7> 2.3176, <8> 23.154, <9> 29.1259, <10> 10.0631;
param capacity[MACHINE] := <1> 180.0437, <2> 180.0437, <3> 180.0437;

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
