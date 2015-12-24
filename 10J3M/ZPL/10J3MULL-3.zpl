set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.9183, <2> 39.5342, <3> 39.933, <4> 44.3462, <5> 27.8834, <6> 36.8274, <7> 10.7804, <8> 3.8277, <9> 18.8014, <10> 0.605;
param workload[JOB] := <1> 14.9183, <2> 39.5342, <3> 39.933, <4> 44.3462, <5> 27.8834, <6> 36.8274, <7> 10.7804, <8> 3.8277, <9> 18.8014, <10> 0.605;
param capacity[MACHINE] := <1> 79.1523, <2> 79.1523, <3> 79.1523;

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
