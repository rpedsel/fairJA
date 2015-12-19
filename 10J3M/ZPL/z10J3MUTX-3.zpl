set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 12.2564, <2> 27.7357, <3> 11.6086, <4> 22.6864, <5> 38.7658, <6> 22.2019, <7> 8.1643, <8> 45.7779, <9> 32.5828, <10> 47.627;
param workload[JOB] := <1> 3.5009, <2> 5.2665, <3> 3.4071, <4> 4.763, <5> 6.2262, <6> 4.7119, <7> 2.8573, <8> 6.7659, <9> 5.7081, <10> 6.9012;
param capacity[MACHINE] := <1> 12.527, <2> 12.527, <3> 12.527;

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
