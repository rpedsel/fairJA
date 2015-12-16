set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.2794, <2> 19.9588, <3> 16.6218, <4> 26.8562, <5> 29.9439, <6> 26.9688, <7> 32.2346, <8> 23.9643, <9> 21.2509, <10> 36.0795;
param workload[JOB] := <1> 4.8249, <2> 4.4675, <3> 4.077, <4> 5.1823, <5> 5.4721, <6> 5.1931, <7> 5.6776, <8> 4.8953, <9> 4.6099, <10> 6.0066;
param capacity[MACHINE] := <1> 12.6016, <2> 12.6016, <3> 12.6016;

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
