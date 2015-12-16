set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.1084, <2> 37.1532, <3> 47.8998, <4> 43.6907, <5> 8.6272, <6> 49.0325, <7> 16.2077, <8> 15.1823, <9> 3.5708, <10> 1.7609;
param workload[JOB] := <1> 2034.7678, <2> 1380.3603, <3> 2294.3908, <4> 1908.8773, <5> 74.4286, <6> 2404.1861, <7> 262.6895, <8> 230.5022, <9> 12.7506, <10> 3.1008;
param capacity[MACHINE] := <1> 3535.3513, <2> 3535.3513, <3> 3535.3513;

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
