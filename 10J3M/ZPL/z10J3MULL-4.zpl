set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1443, <2> 44.1876, <3> 39.5818, <4> 43.1556, <5> 32.5427, <6> 45.7968, <7> 22.5647, <8> 17.3658, <9> 16.6269, <10> 12.5908;
param workload[JOB] := <1> 19.1443, <2> 44.1876, <3> 39.5818, <4> 43.1556, <5> 32.5427, <6> 45.7968, <7> 22.5647, <8> 17.3658, <9> 16.6269, <10> 12.5908;
param capacity[MACHINE] := <1> 97.8523, <2> 97.8523, <3> 97.8523;

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
