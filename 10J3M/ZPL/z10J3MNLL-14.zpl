set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.1481, <2> 30.8214, <3> 22.406, <4> 28.7673, <5> 17.6838, <6> 18.7117, <7> 27.88, <8> 27.6279, <9> 16.2956, <10> 25.1453;
param workload[JOB] := <1> 23.1481, <2> 30.8214, <3> 22.406, <4> 28.7673, <5> 17.6838, <6> 18.7117, <7> 27.88, <8> 27.6279, <9> 16.2956, <10> 25.1453;
param capacity[MACHINE] := <1> 79.4957, <2> 79.4957, <3> 79.4957;

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
