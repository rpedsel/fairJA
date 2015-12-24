set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.5126, <2> 45.022, <3> 32.0858, <4> 41.3424, <5> 11.4328, <6> 6.1494, <7> 42.262, <8> 31.8995, <9> 10.1326, <10> 36.0747;
param workload[JOB] := <1> 39.5126, <2> 45.022, <3> 32.0858, <4> 41.3424, <5> 11.4328, <6> 6.1494, <7> 42.262, <8> 31.8995, <9> 10.1326, <10> 36.0747;
param capacity[MACHINE] := <1> 73.9784, <2> 73.9784, <3> 73.9784;

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
