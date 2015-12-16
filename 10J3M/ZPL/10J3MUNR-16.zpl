set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.0112, <2> 27.5373, <3> 43.8496, <4> 12.0284, <5> 0.0261, <6> 25.4185, <7> 2.085, <8> 25.1313, <9> 17.375, <10> 39.074;
param workload[JOB] := <1> 17.6613, <2> 10.9989, <3> 38.6442, <4> 45.0752, <5> 10.2658, <6> 1.7417, <7> 10.7167, <8> 32.0893, <9> 4.8213, <10> 5.2099;
param capacity[MACHINE] := <1> 177.2243, <2> 177.2243, <3> 177.2243;

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
