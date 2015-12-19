set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1204, <2> 23.7163, <3> 22.0588, <4> 31.57, <5> 25.904, <6> 21.6544, <7> 19.0946, <8> 21.4128, <9> 28.4302, <10> 31.1986;
param workload[JOB] := <1> 631.0345, <2> 562.4629, <3> 486.5907, <4> 996.6649, <5> 671.0172, <6> 468.913, <7> 364.6037, <8> 458.508, <9> 808.2763, <10> 973.3526;
param capacity[MACHINE] := <1> 1605.356, <2> 1605.356, <3> 1605.356;

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
