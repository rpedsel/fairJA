set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.5541, <2> 20.2697, <3> 26.6474, <4> 34.3796, <5> 29.823, <6> 23.1525, <7> 29.3993, <8> 33.1314, <9> 33.7232, <10> 24.0698;
param workload[JOB] := <1> 14.5541, <2> 20.2697, <3> 26.6474, <4> 34.3796, <5> 29.823, <6> 23.1525, <7> 29.3993, <8> 33.1314, <9> 33.7232, <10> 24.0698;
param capacity[MACHINE] := <1> 67.2875, <2> 67.2875, <3> 67.2875;

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
