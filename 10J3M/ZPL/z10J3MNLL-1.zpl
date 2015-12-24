set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 13.7792, <2> 20.265, <3> 25.2088, <4> 20.1127, <5> 25.8785, <6> 24.6611, <7> 27.8358, <8> 37.4363, <9> 22.1112, <10> 34.6031;
param workload[JOB] := <1> 13.7792, <2> 20.265, <3> 25.2088, <4> 20.1127, <5> 25.8785, <6> 24.6611, <7> 27.8358, <8> 37.4363, <9> 22.1112, <10> 34.6031;
param capacity[MACHINE] := <1> 83.9639, <2> 83.9639, <3> 83.9639;

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
