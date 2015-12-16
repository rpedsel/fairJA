set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.2065, <2> 16.8167, <3> 14.3942, <4> 16.8823, <5> 25.0236, <6> 13.6832, <7> 43.7195, <8> 36.7689, <9> 28.6177, <10> 29.7403;
param workload[JOB] := <1> 6.8707, <2> 4.1008, <3> 3.794, <4> 4.1088, <5> 5.0024, <6> 3.6991, <7> 6.6121, <8> 6.0637, <9> 5.3496, <10> 5.4535;
param capacity[MACHINE] := <1> 51.0547, <2> 51.0547, <3> 51.0547;

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
