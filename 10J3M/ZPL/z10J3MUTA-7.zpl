set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.8959, <2> 12.3885, <3> 18.6452, <4> 25.6869, <5> 20.6149, <6> 26.6824, <7> 21.0367, <8> 12.1708, <9> 25.8681, <10> 4.9374;
param workload[JOB] := <1> 1591.6828, <2> 153.4749, <3> 347.6435, <4> 659.8168, <5> 424.9741, <6> 711.9505, <7> 442.5427, <8> 148.1284, <9> 669.1586, <10> 24.3779;
param capacity[MACHINE] := <1> 1293.4376, <2> 1293.4376, <3> 1293.4376;

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
