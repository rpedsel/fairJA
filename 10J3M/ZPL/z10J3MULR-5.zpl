set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.6843, <2> 9.7304, <3> 9.1855, <4> 19.7247, <5> 8.1921, <6> 16.746, <7> 23.1694, <8> 32.2784, <9> 36.3977, <10> 40.2687;
param workload[JOB] := <1> 37.8485, <2> 31.0287, <3> 16.6711, <4> 1.2946, <5> 27.0076, <6> 35.3362, <7> 29.532, <8> 33.9888, <9> 18.177, <10> 26.7706;
param capacity[MACHINE] := <1> 85.885, <2> 85.885, <3> 85.885;

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
