set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.3626, <2> 40.0108, <3> 30.6546, <4> 43.9968, <5> 38.8627, <6> 47.7286, <7> 44.9969, <8> 45.4399, <9> 46.8917, <10> 0.2974;
param workload[JOB] := <1> 31.3626, <2> 40.0108, <3> 30.6546, <4> 43.9968, <5> 38.8627, <6> 47.7286, <7> 44.9969, <8> 45.4399, <9> 46.8917, <10> 0.2974;
param capacity[MACHINE] := <1> 123.414, <2> 123.414, <3> 123.414;

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
