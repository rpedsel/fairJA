set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.0687, <2> 20.9589, <3> 23.8711, <4> 46.7987, <5> 10.8203, <6> 30.2736, <7> 7.7259, <8> 13.7274, <9> 1.8332, <10> 15.8475;
param workload[JOB] := <1> 4.6918, <2> 16.4438, <3> 48.9754, <4> 47.0971, <5> 12.4362, <6> 15.119, <7> 6.1639, <8> 11.3848, <9> 31.1862, <10> 33.1755;
param capacity[MACHINE] := <1> 56.6684, <2> 56.6684, <3> 56.6684;

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
