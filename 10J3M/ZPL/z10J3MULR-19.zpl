set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.513, <2> 45.7106, <3> 0.0734, <4> 9.2667, <5> 30.9038, <6> 5.8356, <7> 14.4556, <8> 24.196, <9> 10.5165, <10> 20.608;
param workload[JOB] := <1> 24.6647, <2> 2.1382, <3> 39.8945, <4> 1.6628, <5> 8.4695, <6> 41.8212, <7> 39.7679, <8> 27.3656, <9> 33.7929, <10> 23.2368;
param capacity[MACHINE] := <1> 80.938, <2> 80.938, <3> 80.938;

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
