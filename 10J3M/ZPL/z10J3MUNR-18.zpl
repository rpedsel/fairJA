set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 0.1642, <2> 19.0578, <3> 49.3766, <4> 30.9641, <5> 4.7276, <6> 16.3703, <7> 23.5963, <8> 5.4955, <9> 9.0283, <10> 44.7999;
param workload[JOB] := <1> 44.9862, <2> 1.6193, <3> 31.6763, <4> 9.1576, <5> 37.9571, <6> 20.7475, <7> 18.179, <8> 38.4099, <9> 9.8918, <10> 28.7906;
param capacity[MACHINE] := <1> 241.4153, <2> 241.4153, <3> 241.4153;

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
