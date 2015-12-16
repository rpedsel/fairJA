set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7817, <2> 46.4543, <3> 48.2718, <4> 19.3884, <5> 29.893, <6> 4.564, <7> 30.5673, <8> 3.4751, <9> 1.8332, <10> 31.6332;
param workload[JOB] := <1> 28.0822, <2> 11.9826, <3> 44.7919, <4> 40.3435, <5> 13.2702, <6> 12.2413, <7> 13.006, <8> 5.5663, <9> 4.0012, <10> 27.2575;
param capacity[MACHINE] := <1> 66.8476, <2> 66.8476, <3> 66.8476;

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
