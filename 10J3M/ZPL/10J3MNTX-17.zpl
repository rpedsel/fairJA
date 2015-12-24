set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.7516, <2> 23.0697, <3> 30.3779, <4> 23.4749, <5> 39.5061, <6> 30.0298, <7> 29.8713, <8> 27.1063, <9> 23.928, <10> 16.4105;
param workload[JOB] := <1> 4.8736, <2> 4.8031, <3> 5.5116, <4> 4.8451, <5> 6.2854, <6> 5.4799, <7> 5.4655, <8> 5.2064, <9> 4.8916, <10> 4.051;
param capacity[MACHINE] := <1> 12.8533, <2> 12.8533, <3> 12.8533;

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
