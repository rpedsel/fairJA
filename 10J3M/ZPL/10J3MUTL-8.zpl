set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.4697, <2> 15.6476, <3> 7.4369, <4> 16.4209, <5> 32.4358, <6> 15.7935, <7> 49.8559, <8> 32.6612, <9> 31.5614, <10> 2.6149;
param workload[JOB] := <1> 41.4697, <2> 15.6476, <3> 7.4369, <4> 16.4209, <5> 32.4358, <6> 15.7935, <7> 49.8559, <8> 32.6612, <9> 31.5614, <10> 2.6149;
param capacity[MACHINE] := <1> 61.4744, <2> 61.4744, <3> 61.4744;

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
