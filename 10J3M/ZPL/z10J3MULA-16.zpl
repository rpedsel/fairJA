set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.4638, <2> 16.907, <3> 14.7194, <4> 20.3285, <5> 25.8615, <6> 20.28, <7> 16.4301, <8> 32.2122, <9> 24.1694, <10> 2.8831;
param workload[JOB] := <1> 181.2739, <2> 285.8466, <3> 216.6607, <4> 413.2479, <5> 668.8172, <6> 411.2784, <7> 269.9482, <8> 1037.6258, <9> 584.1599, <10> 8.3123;
param capacity[MACHINE] := <1> 1359.057, <2> 1359.057, <3> 1359.057;

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
