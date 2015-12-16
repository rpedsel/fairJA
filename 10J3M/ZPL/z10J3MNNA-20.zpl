set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.3671, <2> 38.8269, <3> 20.1817, <4> 17.9068, <5> 23.2155, <6> 34.7029, <7> 20.8138, <8> 20.1493, <9> 34.0655, <10> 21.6653;
param workload[JOB] := <1> 1113.3634, <2> 1507.5282, <3> 407.301, <4> 320.6535, <5> 538.9594, <6> 1204.2913, <7> 433.2143, <8> 405.9943, <9> 1160.4583, <10> 469.3852;
param capacity[MACHINE] := <1> 7561.1489, <2> 7561.1489, <3> 7561.1489;

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
