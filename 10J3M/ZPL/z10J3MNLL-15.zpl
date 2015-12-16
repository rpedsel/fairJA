set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.3846, <2> 26.4344, <3> 23.2805, <4> 21.0598, <5> 19.9097, <6> 23.3578, <7> 30.0457, <8> 22.9279, <9> 23.2534, <10> 29.1659;
param workload[JOB] := <1> 32.3846, <2> 26.4344, <3> 23.2805, <4> 21.0598, <5> 19.9097, <6> 23.3578, <7> 30.0457, <8> 22.9279, <9> 23.2534, <10> 29.1659;
param capacity[MACHINE] := <1> 83.9399, <2> 83.9399, <3> 83.9399;

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
