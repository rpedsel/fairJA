set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4201, <2> 30.7759, <3> 35.254, <4> 40.6758, <5> 5.7006, <6> 2.9114, <7> 29.1785, <8> 41.1334, <9> 9.6491, <10> 18.3754;
param workload[JOB] := <1> 21.2095, <2> 43.3126, <3> 28.9263, <4> 47.5915, <5> 17.4587, <6> 7.5579, <7> 37.1103, <8> 19.4738, <9> 36.6348, <10> 6.0443;
param capacity[MACHINE] := <1> 88.4399, <2> 88.4399, <3> 88.4399;

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
