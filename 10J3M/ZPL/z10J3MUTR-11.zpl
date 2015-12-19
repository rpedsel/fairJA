set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.6363, <2> 25.2164, <3> 47.4395, <4> 14.5113, <5> 45.5433, <6> 28.1753, <7> 45.2938, <8> 7.2499, <9> 31.137, <10> 35.4734;
param workload[JOB] := <1> 8.9741, <2> 14.3754, <3> 12.3176, <4> 46.7486, <5> 5.3895, <6> 13.1935, <7> 4.3166, <8> 30.9178, <9> 29.4371, <10> 3.5716;
param capacity[MACHINE] := <1> 42.3104, <2> 42.3104, <3> 42.3104;

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
