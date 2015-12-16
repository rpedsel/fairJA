set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.1498, <2> 10.4223, <3> 47.6391, <4> 43.304, <5> 16.2491, <6> 43.7114, <7> 39.2799, <8> 34.6593, <9> 9.8119, <10> 42.4249;
param workload[JOB] := <1> 5.3991, <2> 3.2284, <3> 6.9021, <4> 6.5806, <5> 4.031, <6> 6.6115, <7> 6.2674, <8> 5.8872, <9> 3.1324, <10> 6.5134;
param capacity[MACHINE] := <1> 13.6383, <2> 13.6383, <3> 13.6383;

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
