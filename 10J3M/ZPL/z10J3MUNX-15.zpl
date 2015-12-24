set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.0633, <2> 44.7594, <3> 49.5335, <4> 41.2863, <5> 22.6652, <6> 40.5471, <7> 37.8792, <8> 6.316, <9> 44.9548, <10> 22.6005;
param workload[JOB] := <1> 1.7502, <2> 6.6902, <3> 7.038, <4> 6.4254, <5> 4.7608, <6> 6.3677, <7> 6.1546, <8> 2.5132, <9> 6.7048, <10> 4.754;
param capacity[MACHINE] := <1> 53.1589, <2> 53.1589, <3> 53.1589;

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
