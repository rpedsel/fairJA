set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.8426, <2> 16.581, <3> 47.5928, <4> 46.4225, <5> 20.8209, <6> 39.6237, <7> 23.8384, <8> 29.4681, <9> 42.5024, <10> 22.185;
param workload[JOB] := <1> 2.2006, <2> 4.072, <3> 6.8988, <4> 6.8134, <5> 4.563, <6> 6.2947, <7> 4.8825, <8> 5.4285, <9> 6.5194, <10> 4.7101;
param capacity[MACHINE] := <1> 52.383, <2> 52.383, <3> 52.383;

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
