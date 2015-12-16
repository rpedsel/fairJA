set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.9071, <2> 35.1475, <3> 31.9027, <4> 31.8146, <5> 22.6101, <6> 27.8888, <7> 28.0288, <8> 19.4021, <9> 29.1019, <10> 21.003;
param workload[JOB] := <1> 30.9071, <2> 35.1475, <3> 31.9027, <4> 31.8146, <5> 22.6101, <6> 27.8888, <7> 28.0288, <8> 19.4021, <9> 29.1019, <10> 21.003;
param capacity[MACHINE] := <1> 277.8066, <2> 277.8066, <3> 277.8066;

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
