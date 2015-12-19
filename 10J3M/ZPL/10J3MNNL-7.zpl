set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.9688, <2> 17.9922, <3> 33.026, <4> 28.3177, <5> 18.3358, <6> 22.732, <7> 28.3586, <8> 27.6612, <9> 22.7845, <10> 28.6578;
param workload[JOB] := <1> 33.9688, <2> 17.9922, <3> 33.026, <4> 28.3177, <5> 18.3358, <6> 22.732, <7> 28.3586, <8> 27.6612, <9> 22.7845, <10> 28.6578;
param capacity[MACHINE] := <1> 261.8346, <2> 261.8346, <3> 261.8346;

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
