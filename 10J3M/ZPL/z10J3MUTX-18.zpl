set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.875, <2> 44.0524, <3> 5.0696, <4> 3.3443, <5> 25.7275, <6> 29.7372, <7> 30.4357, <8> 6.676, <9> 15.2595, <10> 42.0626;
param workload[JOB] := <1> 4.2279, <2> 6.6372, <3> 2.2516, <4> 1.8287, <5> 5.0722, <6> 5.4532, <7> 5.5169, <8> 2.5838, <9> 3.9063, <10> 6.4856;
param capacity[MACHINE] := <1> 10.9909, <2> 10.9909, <3> 10.9909;

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
