set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2536, <2> 21.3704, <3> 29.1893, <4> 33.8071, <5> 32.2997, <6> 33.0286, <7> 17.1881, <8> 28.976, <9> 25.9704, <10> 18.7449;
param workload[JOB] := <1> 26.2536, <2> 21.3704, <3> 29.1893, <4> 33.8071, <5> 32.2997, <6> 33.0286, <7> 17.1881, <8> 28.976, <9> 25.9704, <10> 18.7449;
param capacity[MACHINE] := <1> 88.9427, <2> 88.9427, <3> 88.9427;

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
