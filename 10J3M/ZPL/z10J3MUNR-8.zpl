set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7173, <2> 31.5827, <3> 31.416, <4> 20.6701, <5> 25.8158, <6> 24.8509, <7> 42.4562, <8> 36.6058, <9> 6.7202, <10> 12.532;
param workload[JOB] := <1> 19.75, <2> 49.2596, <3> 26.6443, <4> 5.8362, <5> 18.7766, <6> 44.6949, <7> 26.8603, <8> 5.9756, <9> 29.1977, <10> 16.9118;
param capacity[MACHINE] := <1> 243.907, <2> 243.907, <3> 243.907;

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
