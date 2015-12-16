set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0821, <2> 28.3051, <3> 29.9416, <4> 28.1619, <5> 23.1055, <6> 25.8638, <7> 25.5066, <8> 25.9026, <9> 23.563, <10> 19.5681;
param workload[JOB] := <1> 24.0711, <2> 46.2446, <3> 15.1516, <4> 42.9703, <5> 48.1693, <6> 8.489, <7> 49.5345, <8> 12.6553, <9> 36.3176, <10> 13.6396;
param capacity[MACHINE] := <1> 99.081, <2> 99.081, <3> 99.081;

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
