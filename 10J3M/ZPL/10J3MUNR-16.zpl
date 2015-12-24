set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.6143, <2> 6.0523, <3> 44.5185, <4> 41.6808, <5> 48.9034, <6> 30.321, <7> 22.5508, <8> 25.9385, <9> 9.0708, <10> 43.8803;
param workload[JOB] := <1> 8.1635, <2> 8.3391, <3> 16.0366, <4> 28.7331, <5> 43.9013, <6> 27.4225, <7> 48.472, <8> 35.4749, <9> 18.1674, <10> 35.0144;
param capacity[MACHINE] := <1> 269.7248, <2> 269.7248, <3> 269.7248;

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
