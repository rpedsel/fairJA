set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.7007, <2> 30.5064, <3> 21.3964, <4> 31.2842, <5> 20.303, <6> 23.0985, <7> 22.7203, <8> 26.1067, <9> 16.2068, <10> 26.3848;
param workload[JOB] := <1> 767.3288, <2> 930.6404, <3> 457.8059, <4> 978.7012, <5> 412.2118, <6> 533.5407, <7> 516.212, <8> 681.5598, <9> 262.6604, <10> 696.1577;
param capacity[MACHINE] := <1> 2078.9396, <2> 2078.9396, <3> 2078.9396;

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
