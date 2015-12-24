set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.0662, <2> 47.2752, <3> 30.3912, <4> 49.5648, <5> 1.7885, <6> 40.3822, <7> 42.7637, <8> 42.5302, <9> 38.627, <10> 27.205;
param workload[JOB] := <1> 48.7906, <2> 46.4119, <3> 48.4655, <4> 40.1694, <5> 25.5286, <6> 19.4698, <7> 25.9228, <8> 18.7172, <9> 2.902, <10> 1.7004;
param capacity[MACHINE] := <1> 92.6927, <2> 92.6927, <3> 92.6927;

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
