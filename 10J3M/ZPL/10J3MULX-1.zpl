set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.3418, <2> 44.1071, <3> 23.4727, <4> 33.3826, <5> 15.8093, <6> 46.2059, <7> 0.7275, <8> 19.7127, <9> 36.5141, <10> 42.4668;
param workload[JOB] := <1> 4.1643, <2> 6.6413, <3> 4.8449, <4> 5.7778, <5> 3.9761, <6> 6.7975, <7> 0.8529, <8> 4.4399, <9> 6.0427, <10> 6.5167;
param capacity[MACHINE] := <1> 16.6847, <2> 16.6847, <3> 16.6847;

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
