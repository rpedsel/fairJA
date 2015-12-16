set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0713, <2> 17.1814, <3> 20.3674, <4> 25.9364, <5> 21.0833, <6> 22.4733, <7> 27.2486, <8> 21.3671, <9> 24.8017, <10> 25.9296;
param workload[JOB] := <1> 1.0815, <2> 47.2191, <3> 38.312, <4> 20.4587, <5> 28.7919, <6> 30.3804, <7> 19.9837, <8> 24.2608, <9> 15.4579, <10> 21.9211;
param capacity[MACHINE] := <1> 61.9668, <2> 61.9668, <3> 61.9668;

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
