set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.0735, <2> 47.2065, <3> 7.7241, <4> 32.3299, <5> 10.2141, <6> 23.4198, <7> 12.9374, <8> 28.2112, <9> 38.2236, <10> 17.5654;
param workload[JOB] := <1> 12.0735, <2> 47.2065, <3> 7.7241, <4> 32.3299, <5> 10.2141, <6> 23.4198, <7> 12.9374, <8> 28.2112, <9> 38.2236, <10> 17.5654;
param capacity[MACHINE] := <1> 76.6352, <2> 76.6352, <3> 76.6352;

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
