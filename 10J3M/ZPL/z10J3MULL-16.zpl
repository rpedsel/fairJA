set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.9222, <2> 33.264, <3> 15.4841, <4> 29.079, <5> 40.8671, <6> 0.0106, <7> 34.1407, <8> 5.0229, <9> 5.5189, <10> 44.9433;
param workload[JOB] := <1> 42.9222, <2> 33.264, <3> 15.4841, <4> 29.079, <5> 40.8671, <6> 0.0106, <7> 34.1407, <8> 5.0229, <9> 5.5189, <10> 44.9433;
param capacity[MACHINE] := <1> 83.7509, <2> 83.7509, <3> 83.7509;

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
