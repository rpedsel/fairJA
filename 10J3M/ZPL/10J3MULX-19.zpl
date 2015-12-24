set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.2048, <2> 13.7993, <3> 45.5125, <4> 3.8964, <5> 38.8775, <6> 36.8918, <7> 49.5813, <8> 44.3604, <9> 8.7311, <10> 40.9786;
param workload[JOB] := <1> 3.1945, <2> 3.7147, <3> 6.7463, <4> 1.9739, <5> 6.2352, <6> 6.0739, <7> 7.0414, <8> 6.6604, <9> 2.9548, <10> 6.4015;
param capacity[MACHINE] := <1> 16.9989, <2> 16.9989, <3> 16.9989;

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
