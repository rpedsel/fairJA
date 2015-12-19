set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.3938, <2> 47.8378, <3> 20.384, <4> 48.8208, <5> 45.3663, <6> 32.0363, <7> 47.4987, <8> 5.5953, <9> 14.9607, <10> 23.9658;
param workload[JOB] := <1> 8.7774, <2> 29.6549, <3> 14.708, <4> 41.5766, <5> 30.0884, <6> 1.0035, <7> 48.1228, <8> 3.9905, <9> 46.3678, <10> 40.7558;
param capacity[MACHINE] := <1> 66.2614, <2> 66.2614, <3> 66.2614;

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
