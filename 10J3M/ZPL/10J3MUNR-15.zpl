set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.8035, <2> 21.3981, <3> 48.2375, <4> 1.6223, <5> 3.3182, <6> 19.246, <7> 24.3405, <8> 37.1878, <9> 38.8113, <10> 46.9999;
param workload[JOB] := <1> 24.5317, <2> 7.0629, <3> 39.9246, <4> 15.5509, <5> 19.8573, <6> 31.3907, <7> 38.7625, <8> 19.0428, <9> 25.424, <10> 44.2696;
param capacity[MACHINE] := <1> 265.817, <2> 265.817, <3> 265.817;

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
