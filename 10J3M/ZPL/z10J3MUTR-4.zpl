set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.1879, <2> 36.1307, <3> 38.8563, <4> 36.9571, <5> 10.1065, <6> 49.9106, <7> 1.6141, <8> 13.6393, <9> 6.672, <10> 19.9654;
param workload[JOB] := <1> 14.7595, <2> 38.2637, <3> 3.174, <4> 41.7806, <5> 41.9894, <6> 31.1117, <7> 45.1797, <8> 5.5397, <9> 17.0413, <10> 15.0605;
param capacity[MACHINE] := <1> 63.475, <2> 63.475, <3> 63.475;

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
