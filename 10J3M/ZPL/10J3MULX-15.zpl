set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.9901, <2> 16.6446, <3> 24.3735, <4> 15.7882, <5> 15.3619, <6> 27.1547, <7> 43.6777, <8> 28.8684, <9> 35.4298, <10> 22.2169;
param workload[JOB] := <1> 2.8267, <2> 4.0798, <3> 4.937, <4> 3.9734, <5> 3.9194, <6> 5.211, <7> 6.6089, <8> 5.3729, <9> 5.9523, <10> 4.7135;
param capacity[MACHINE] := <1> 15.865, <2> 15.865, <3> 15.865;

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
