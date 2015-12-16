set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.2995, <2> 15.9582, <3> 30.354, <4> 26.2407, <5> 44.3415, <6> 13.4357, <7> 43.0551, <8> 7.697, <9> 1.3792, <10> 29.3241;
param workload[JOB] := <1> 6.5038, <2> 3.9948, <3> 5.5094, <4> 5.1226, <5> 6.6589, <6> 3.6655, <7> 6.5616, <8> 2.7743, <9> 1.1744, <10> 5.4152;
param capacity[MACHINE] := <1> 15.7935, <2> 15.7935, <3> 15.7935;

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
