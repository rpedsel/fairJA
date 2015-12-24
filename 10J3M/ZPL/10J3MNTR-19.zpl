set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0813, <2> 25.1344, <3> 27.4872, <4> 18.5643, <5> 22.0176, <6> 22.9996, <7> 25.8342, <8> 24.8843, <9> 20.0127, <10> 16.6552;
param workload[JOB] := <1> 23.3697, <2> 47.0357, <3> 14.3488, <4> 21.1959, <5> 6.7537, <6> 23.0697, <7> 6.7163, <8> 41.1382, <9> 29.5456, <10> 2.2147;
param capacity[MACHINE] := <1> 53.8471, <2> 53.8471, <3> 53.8471;

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
