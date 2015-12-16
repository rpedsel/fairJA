set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.4114, <2> 20.2917, <3> 20.0128, <4> 26.1165, <5> 21.656, <6> 31.9977, <7> 23.8079, <8> 25.3177, <9> 23.028, <10> 19.4342;
param workload[JOB] := <1> 48.2148, <2> 5.2531, <3> 14.4772, <4> 4.4574, <5> 40.9017, <6> 22.385, <7> 46.7114, <8> 26.9749, <9> 6.6828, <10> 24.9673;
param capacity[MACHINE] := <1> 241.0256, <2> 241.0256, <3> 241.0256;

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
