set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.9158, <2> 31.0574, <3> 24.0889, <4> 22.1143, <5> 23.7578, <6> 19.0603, <7> 33.8906, <8> 20.0141, <9> 29.9401, <10> 27.0424;
param workload[JOB] := <1> 34.9158, <2> 31.0574, <3> 24.0889, <4> 22.1143, <5> 23.7578, <6> 19.0603, <7> 33.8906, <8> 20.0141, <9> 29.9401, <10> 27.0424;
param capacity[MACHINE] := <1> 265.8817, <2> 265.8817, <3> 265.8817;

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
