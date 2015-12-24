set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.7351, <2> 25.6021, <3> 21.028, <4> 19.2643, <5> 19.7538, <6> 22.5104, <7> 29.3012, <8> 26.8968, <9> 16.8674, <10> 27.8853;
param workload[JOB] := <1> 33.7351, <2> 25.6021, <3> 21.028, <4> 19.2643, <5> 19.7538, <6> 22.5104, <7> 29.3012, <8> 26.8968, <9> 16.8674, <10> 27.8853;
param capacity[MACHINE] := <1> 80.9481, <2> 80.9481, <3> 80.9481;

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
