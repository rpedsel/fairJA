set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1371, <2> 16.3925, <3> 23.6703, <4> 14.5465, <5> 24.6472, <6> 19.6209, <7> 21.9101, <8> 32.6239, <9> 25.5672, <10> 24.8067;
param workload[JOB] := <1> 4.3746, <2> 4.0488, <3> 4.8652, <4> 3.814, <5> 4.9646, <6> 4.4295, <7> 4.6808, <8> 5.7117, <9> 5.0564, <10> 4.9806;
param capacity[MACHINE] := <1> 46.9262, <2> 46.9262, <3> 46.9262;

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
