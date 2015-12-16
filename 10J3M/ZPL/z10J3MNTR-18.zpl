set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7117, <2> 30.3001, <3> 14.5591, <4> 31.2013, <5> 25.1705, <6> 22.5899, <7> 21.6998, <8> 23.6596, <9> 23.8616, <10> 27.1434;
param workload[JOB] := <1> 34.0877, <2> 29.6482, <3> 31.505, <4> 5.4207, <5> 29.0926, <6> 15.8632, <7> 9.8142, <8> 6.455, <9> 33.9573, <10> 27.7886;
param capacity[MACHINE] := <1> 55.9082, <2> 55.9082, <3> 55.9082;

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
