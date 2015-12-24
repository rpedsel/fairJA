set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.9024, <2> 22.8746, <3> 27.7567, <4> 32.319, <5> 23.8819, <6> 17.318, <7> 21.7055, <8> 26.2445, <9> 28.3185, <10> 23.8313;
param workload[JOB] := <1> 4.1113, <2> 4.7827, <3> 5.2685, <4> 5.685, <5> 4.8869, <6> 4.1615, <7> 4.6589, <8> 5.1229, <9> 5.3215, <10> 4.8817;
param capacity[MACHINE] := <1> 16.2936, <2> 16.2936, <3> 16.2936;

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
