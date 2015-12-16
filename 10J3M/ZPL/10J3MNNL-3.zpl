set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.2877, <2> 19.42, <3> 33.6026, <4> 22.1954, <5> 27.2399, <6> 24.0515, <7> 24.4783, <8> 22.8307, <9> 32.6626, <10> 31.7398;
param workload[JOB] := <1> 19.2877, <2> 19.42, <3> 33.6026, <4> 22.1954, <5> 27.2399, <6> 24.0515, <7> 24.4783, <8> 22.8307, <9> 32.6626, <10> 31.7398;
param capacity[MACHINE] := <1> 257.5085, <2> 257.5085, <3> 257.5085;

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
