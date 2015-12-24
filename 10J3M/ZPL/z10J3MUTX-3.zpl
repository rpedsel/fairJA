set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1158, <2> 49.4335, <3> 49.5418, <4> 46.4559, <5> 29.3757, <6> 16.7914, <7> 21.4519, <8> 42.0928, <9> 27.0296, <10> 20.9544;
param workload[JOB] := <1> 4.9108, <2> 7.0309, <3> 7.0386, <4> 6.8159, <5> 5.4199, <6> 4.0977, <7> 4.6316, <8> 6.4879, <9> 5.199, <10> 4.5776;
param capacity[MACHINE] := <1> 14.0525, <2> 14.0525, <3> 14.0525;

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
