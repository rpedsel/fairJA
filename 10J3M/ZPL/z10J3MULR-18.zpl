set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.4078, <2> 37.4209, <3> 30.3344, <4> 44.03, <5> 39.6488, <6> 28.3919, <7> 33.111, <8> 47.5637, <9> 14.4417, <10> 37.0888;
param workload[JOB] := <1> 16.5344, <2> 34.456, <3> 46.0627, <4> 7.5443, <5> 21.5302, <6> 47.2797, <7> 24.4413, <8> 3.0282, <9> 43.1652, <10> 36.8429;
param capacity[MACHINE] := <1> 93.6283, <2> 93.6283, <3> 93.6283;

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
