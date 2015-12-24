set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.1071, <2> 29.6079, <3> 20.9991, <4> 7.4225, <5> 17.308, <6> 36.0977, <7> 4.7179, <8> 39.578, <9> 16.3425, <10> 4.1875;
param workload[JOB] := <1> 10.1071, <2> 29.6079, <3> 20.9991, <4> 7.4225, <5> 17.308, <6> 36.0977, <7> 4.7179, <8> 39.578, <9> 16.3425, <10> 4.1875;
param capacity[MACHINE] := <1> 186.3682, <2> 186.3682, <3> 186.3682;

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
