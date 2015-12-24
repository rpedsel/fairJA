set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.1732, <2> 35.0812, <3> 1.1583, <4> 7.9827, <5> 5.0477, <6> 1.5023, <7> 33.7082, <8> 25.2505, <9> 18.5585, <10> 48.9236;
param workload[JOB] := <1> 5.3874, <2> 41.455, <3> 19.231, <4> 13.6174, <5> 13.1898, <6> 32.0458, <7> 3.0781, <8> 1.4037, <9> 13.8786, <10> 6.2479;
param capacity[MACHINE] := <1> 49.8449, <2> 49.8449, <3> 49.8449;

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
