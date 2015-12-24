set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.104, <2> 19.6456, <3> 24.6541, <4> 3.7003, <5> 14.4991, <6> 5.2524, <7> 37.422, <8> 44.1804, <9> 23.7276, <10> 36.1466;
param workload[JOB] := <1> 6.716, <2> 4.4323, <3> 4.9653, <4> 1.9236, <5> 3.8078, <6> 2.2918, <7> 6.1174, <8> 6.6468, <9> 4.8711, <10> 6.0122;
param capacity[MACHINE] := <1> 47.7843, <2> 47.7843, <3> 47.7843;

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
