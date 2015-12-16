set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.07, <2> 22.5989, <3> 24.8495, <4> 23.3139, <5> 30.1951, <6> 21.6691, <7> 30.974, <8> 13.0036, <9> 22.6631, <10> 27.1742;
param workload[JOB] := <1> 7.0344, <2> 27.6343, <3> 26.223, <4> 2.0716, <5> 21.6072, <6> 37.1236, <7> 28.7123, <8> 34.3617, <9> 26.3798, <10> 36.9023;
param capacity[MACHINE] := <1> 62.0126, <2> 62.0126, <3> 62.0126;

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
