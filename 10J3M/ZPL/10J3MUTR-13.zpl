set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.3997, <2> 38.8058, <3> 42.8187, <4> 32.1758, <5> 41.4705, <6> 7.6816, <7> 37.6472, <8> 16.6185, <9> 10.4576, <10> 45.9875;
param workload[JOB] := <1> 23.3303, <2> 14.7985, <3> 1.9624, <4> 14.7818, <5> 45.9756, <6> 36.7352, <7> 12.4669, <8> 27.4077, <9> 5.6144, <10> 36.962;
param capacity[MACHINE] := <1> 55.0087, <2> 55.0087, <3> 55.0087;

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
