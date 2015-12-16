set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.1486, <2> 22.9642, <3> 20.9241, <4> 21.006, <5> 28.8551, <6> 19.3885, <7> 34.7265, <8> 27.6522, <9> 25.9402, <10> 17.1145;
param workload[JOB] := <1> 4.9141, <2> 4.7921, <3> 4.5743, <4> 4.5832, <5> 5.3717, <6> 4.4032, <7> 5.8929, <8> 5.2585, <9> 5.0932, <10> 4.137;
param capacity[MACHINE] := <1> 12.2551, <2> 12.2551, <3> 12.2551;

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
