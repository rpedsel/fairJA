set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.7099, <2> 20.4833, <3> 24.4199, <4> 23.0727, <5> 20.3079, <6> 21.7072, <7> 22.8182, <8> 23.476, <9> 21.5936, <10> 32.4925;
param workload[JOB] := <1> 4.6594, <2> 4.5258, <3> 4.9416, <4> 4.8034, <5> 4.5064, <6> 4.6591, <7> 4.7768, <8> 4.8452, <9> 4.6469, <10> 5.7002;
param capacity[MACHINE] := <1> 12.0162, <2> 12.0162, <3> 12.0162;

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
