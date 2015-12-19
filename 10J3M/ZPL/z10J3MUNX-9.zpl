set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.2374, <2> 25.9001, <3> 9.8774, <4> 40.5213, <5> 29.6949, <6> 11.3301, <7> 23.7554, <8> 27.8977, <9> 5.6724, <10> 32.1129;
param workload[JOB] := <1> 2.6902, <2> 5.0892, <3> 3.1428, <4> 6.3656, <5> 5.4493, <6> 3.366, <7> 4.874, <8> 5.2818, <9> 2.3817, <10> 5.6668;
param capacity[MACHINE] := <1> 44.3074, <2> 44.3074, <3> 44.3074;

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
