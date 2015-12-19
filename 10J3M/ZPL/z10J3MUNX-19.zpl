set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.2222, <2> 9.3535, <3> 36.0736, <4> 43.9576, <5> 28.314, <6> 43.1153, <7> 38.5845, <8> 13.8973, <9> 43.8634, <10> 31.8705;
param workload[JOB] := <1> 3.0368, <2> 3.0583, <3> 6.0061, <4> 6.6301, <5> 5.3211, <6> 6.5662, <7> 6.2116, <8> 3.7279, <9> 6.6229, <10> 5.6454;
param capacity[MACHINE] := <1> 52.8264, <2> 52.8264, <3> 52.8264;

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
