set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.4999, <2> 23.7475, <3> 24.1243, <4> 16.9304, <5> 24.7525, <6> 20.2858, <7> 24.4632, <8> 30.4383, <9> 28.6731, <10> 33.7245;
param workload[JOB] := <1> 18.4999, <2> 23.7475, <3> 24.1243, <4> 16.9304, <5> 24.7525, <6> 20.2858, <7> 24.4632, <8> 30.4383, <9> 28.6731, <10> 33.7245;
param capacity[MACHINE] := <1> 245.6395, <2> 245.6395, <3> 245.6395;

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
