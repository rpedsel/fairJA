set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.8965, <2> 27.0096, <3> 19.7183, <4> 31.0852, <5> 23.4295, <6> 27.8991, <7> 32.8352, <8> 24.7602, <9> 24.594, <10> 32.8175;
param workload[JOB] := <1> 4.6794, <2> 5.1971, <3> 4.4405, <4> 5.5754, <5> 4.8404, <6> 5.282, <7> 5.7302, <8> 4.976, <9> 4.9592, <10> 5.7287;
param capacity[MACHINE] := <1> 17.1363, <2> 17.1363, <3> 17.1363;

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
