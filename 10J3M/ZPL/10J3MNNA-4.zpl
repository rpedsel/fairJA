set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.697, <2> 20.4654, <3> 21.6227, <4> 21.0039, <5> 19.3885, <6> 31.5482, <7> 19.846, <8> 33.0799, <9> 21.6517, <10> 24.8346;
param workload[JOB] := <1> 609.9418, <2> 418.8326, <3> 467.5412, <4> 441.1638, <5> 375.9139, <6> 995.2889, <7> 393.8637, <8> 1094.2798, <9> 468.7961, <10> 616.7574;
param capacity[MACHINE] := <1> 5882.3792, <2> 5882.3792, <3> 5882.3792;

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
