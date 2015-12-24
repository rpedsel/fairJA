set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.9524, <2> 17.0539, <3> 25.8308, <4> 31.116, <5> 32.3957, <6> 18.1401, <7> 26.9861, <8> 20.0544, <9> 29.0155, <10> 12.5591;
param workload[JOB] := <1> 32.9524, <2> 17.0539, <3> 25.8308, <4> 31.116, <5> 32.3957, <6> 18.1401, <7> 26.9861, <8> 20.0544, <9> 29.0155, <10> 12.5591;
param capacity[MACHINE] := <1> 246.104, <2> 246.104, <3> 246.104;

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
