set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.7181, <2> 23.9942, <3> 24.9156, <4> 24.9152, <5> 17.7153, <6> 29.8146, <7> 21.393, <8> 19.5514, <9> 31.0576, <10> 19.9151;
param workload[JOB] := <1> 4.7664, <2> 4.8984, <3> 4.9916, <4> 4.9915, <5> 4.209, <6> 5.4603, <7> 4.6253, <8> 4.4217, <9> 5.5729, <10> 4.4626;
param capacity[MACHINE] := <1> 16.1332, <2> 16.1332, <3> 16.1332;

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
