set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.9168, <2> 19.721, <3> 14.8268, <4> 39.9012, <5> 13.6379, <6> 23.6862, <7> 35.0741, <8> 22.6604, <9> 25.1997, <10> 23.0327;
param workload[JOB] := <1> 6.4743, <2> 4.4408, <3> 3.8506, <4> 6.3167, <5> 3.693, <6> 4.8668, <7> 5.9223, <8> 4.7603, <9> 5.0199, <10> 4.7992;
param capacity[MACHINE] := <1> 12.5359, <2> 12.5359, <3> 12.5359;

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
