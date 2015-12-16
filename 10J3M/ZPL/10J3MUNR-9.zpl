set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.3345, <2> 42.1959, <3> 23.48, <4> 15.5849, <5> 7.5223, <6> 2.4066, <7> 39.7078, <8> 14.1663, <9> 23.7133, <10> 5.6943;
param workload[JOB] := <1> 23.4629, <2> 0.5479, <3> 22.497, <4> 31.9355, <5> 4.3798, <6> 24.8201, <7> 14.5806, <8> 48.6267, <9> 34.0545, <10> 36.5798;
param capacity[MACHINE] := <1> 241.4848, <2> 241.4848, <3> 241.4848;

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
