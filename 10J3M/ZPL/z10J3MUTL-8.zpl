set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.4652, <2> 16.3221, <3> 28.9779, <4> 21.2875, <5> 16.4864, <6> 14.8931, <7> 31.4207, <8> 39.7123, <9> 35.864, <10> 47.3132;
param workload[JOB] := <1> 0.4652, <2> 16.3221, <3> 28.9779, <4> 21.2875, <5> 16.4864, <6> 14.8931, <7> 31.4207, <8> 39.7123, <9> 35.864, <10> 47.3132;
param capacity[MACHINE] := <1> 63.1856, <2> 63.1856, <3> 63.1856;

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
