set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.2425, <2> 19.357, <3> 25.3187, <4> 17.9057, <5> 26.6738, <6> 25.6182, <7> 35.9747, <8> 19.7126, <9> 25.0693, <10> 25.9654;
param workload[JOB] := <1> 23.2425, <2> 19.357, <3> 25.3187, <4> 17.9057, <5> 26.6738, <6> 25.6182, <7> 35.9747, <8> 19.7126, <9> 25.0693, <10> 25.9654;
param capacity[MACHINE] := <1> 61.2095, <2> 61.2095, <3> 61.2095;

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
