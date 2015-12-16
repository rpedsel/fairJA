set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3585, <2> 35.0621, <3> 22.1234, <4> 31.7331, <5> 30.0088, <6> 21.4161, <7> 24.1044, <8> 24.7784, <9> 17.1786, <10> 22.9521;
param workload[JOB] := <1> 27.3585, <2> 35.0621, <3> 22.1234, <4> 31.7331, <5> 30.0088, <6> 21.4161, <7> 24.1044, <8> 24.7784, <9> 17.1786, <10> 22.9521;
param capacity[MACHINE] := <1> 85.5718, <2> 85.5718, <3> 85.5718;

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
