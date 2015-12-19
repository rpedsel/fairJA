set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.1673, <2> 37.0087, <3> 26.6455, <4> 28.3167, <5> 23.4519, <6> 16.9664, <7> 18.0144, <8> 15.75, <9> 26.7579, <10> 22.4791;
param workload[JOB] := <1> 21.1673, <2> 37.0087, <3> 26.6455, <4> 28.3167, <5> 23.4519, <6> 16.9664, <7> 18.0144, <8> 15.75, <9> 26.7579, <10> 22.4791;
param capacity[MACHINE] := <1> 78.8526, <2> 78.8526, <3> 78.8526;

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
