set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.0223, <2> 4.7871, <3> 27.8663, <4> 10.9309, <5> 17.5741, <6> 25.0749, <7> 31.6831, <8> 13.4089, <9> 38.9371, <10> 17.1198;
param workload[JOB] := <1> 36.1586, <2> 34.1325, <3> 31.0772, <4> 42.2391, <5> 36.7612, <6> 30.1977, <7> 16.0725, <8> 12.1206, <9> 34.7668, <10> 40.9939;
param capacity[MACHINE] := <1> 104.84, <2> 104.84, <3> 104.84;

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
