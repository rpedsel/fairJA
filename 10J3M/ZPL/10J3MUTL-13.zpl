set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 8.1871, <2> 2.9527, <3> 30.431, <4> 36.4994, <5> 31.1024, <6> 15.4928, <7> 20.2531, <8> 25.4154, <9> 30.3226, <10> 4.7298;
param workload[JOB] := <1> 8.1871, <2> 2.9527, <3> 30.431, <4> 36.4994, <5> 31.1024, <6> 15.4928, <7> 20.2531, <8> 25.4154, <9> 30.3226, <10> 4.7298;
param capacity[MACHINE] := <1> 51.3466, <2> 51.3466, <3> 51.3466;

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
