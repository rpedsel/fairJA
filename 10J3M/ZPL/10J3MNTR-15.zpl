set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.519, <2> 21.7531, <3> 24.8279, <4> 23.9468, <5> 22.5038, <6> 27.6346, <7> 18.0593, <8> 23.5991, <9> 24.5566, <10> 18.9423;
param workload[JOB] := <1> 3.0976, <2> 45.6231, <3> 11.6417, <4> 14.44, <5> 46.3596, <6> 5.3157, <7> 37.3455, <8> 6.9572, <9> 15.1854, <10> 4.1739;
param capacity[MACHINE] := <1> 47.5349, <2> 47.5349, <3> 47.5349;

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
