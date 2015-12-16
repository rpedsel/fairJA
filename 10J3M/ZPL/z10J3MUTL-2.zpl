set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.1058, <2> 8.4142, <3> 33.6293, <4> 22.3654, <5> 44.708, <6> 15.1387, <7> 21.9037, <8> 12.5199, <9> 12.0532, <10> 41.197;
param workload[JOB] := <1> 11.1058, <2> 8.4142, <3> 33.6293, <4> 22.3654, <5> 44.708, <6> 15.1387, <7> 21.9037, <8> 12.5199, <9> 12.0532, <10> 41.197;
param capacity[MACHINE] := <1> 55.7588, <2> 55.7588, <3> 55.7588;

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
