set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.5574, <2> 16.3503, <3> 28.3941, <4> 31.8443, <5> 10.2582, <6> 29.4301, <7> 32.6286, <8> 23.9925, <9> 27.3385, <10> 26.5251;
param workload[JOB] := <1> 21.5574, <2> 16.3503, <3> 28.3941, <4> 31.8443, <5> 10.2582, <6> 29.4301, <7> 32.6286, <8> 23.9925, <9> 27.3385, <10> 26.5251;
param capacity[MACHINE] := <1> 82.773, <2> 82.773, <3> 82.773;

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
