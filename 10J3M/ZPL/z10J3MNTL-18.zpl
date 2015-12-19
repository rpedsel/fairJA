set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.6439, <2> 22.9183, <3> 22.9839, <4> 19.042, <5> 28.7001, <6> 26.7718, <7> 31.6822, <8> 26.1823, <9> 31.4098, <10> 24.1218;
param workload[JOB] := <1> 30.6439, <2> 22.9183, <3> 22.9839, <4> 19.042, <5> 28.7001, <6> 26.7718, <7> 31.6822, <8> 26.1823, <9> 31.4098, <10> 24.1218;
param capacity[MACHINE] := <1> 66.114, <2> 66.114, <3> 66.114;

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
