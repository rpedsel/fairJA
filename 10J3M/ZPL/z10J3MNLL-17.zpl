set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.3429, <2> 33.9764, <3> 28.0088, <4> 32.6307, <5> 20.2305, <6> 27.3678, <7> 20.3931, <8> 22.467, <9> 24.2546, <10> 33.6515;
param workload[JOB] := <1> 29.3429, <2> 33.9764, <3> 28.0088, <4> 32.6307, <5> 20.2305, <6> 27.3678, <7> 20.3931, <8> 22.467, <9> 24.2546, <10> 33.6515;
param capacity[MACHINE] := <1> 90.7744, <2> 90.7744, <3> 90.7744;

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
