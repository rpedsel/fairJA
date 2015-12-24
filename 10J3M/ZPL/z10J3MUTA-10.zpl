set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.5861, <2> 43.9107, <3> 12.0434, <4> 16.2909, <5> 4.9826, <6> 6.1075, <7> 15.0239, <8> 29.0792, <9> 29.8226, <10> 10.144;
param workload[JOB] := <1> 383.6153, <2> 1928.1496, <3> 145.0435, <4> 265.3934, <5> 24.8263, <6> 37.3016, <7> 225.7176, <8> 845.5999, <9> 889.3875, <10> 102.9007;
param capacity[MACHINE] := <1> 2704.4131, <2> 2704.4131, <3> 2704.4131;

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
