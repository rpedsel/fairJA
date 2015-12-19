set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.8117, <2> 13.4694, <3> 0.103, <4> 11.8469, <5> 15.5888, <6> 32.4281, <7> 22.255, <8> 22.6838, <9> 32.2656, <10> 47.0203;
param workload[JOB] := <1> 6.6942, <2> 3.6701, <3> 0.3209, <4> 3.4419, <5> 3.9483, <6> 5.6946, <7> 4.7175, <8> 4.7628, <9> 5.6803, <10> 6.8571;
param capacity[MACHINE] := <1> 11.447, <2> 11.447, <3> 11.447;

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
