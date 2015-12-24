set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.9391, <2> 44.6351, <3> 46.696, <4> 34.3837, <5> 2.2021, <6> 27.5521, <7> 18.1137, <8> 15.4185, <9> 37.9221, <10> 23.5207;
param workload[JOB] := <1> 35.5389, <2> 15.7495, <3> 6.2465, <4> 3.7345, <5> 39.2582, <6> 41.9448, <7> 12.9081, <8> 47.1114, <9> 20.5055, <10> 31.3531;
param capacity[MACHINE] := <1> 63.5876, <2> 63.5876, <3> 63.5876;

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
