set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.3227, <2> 24.5513, <3> 25.1895, <4> 24.8583, <5> 31.446, <6> 17.339, <7> 20.3828, <8> 28.7774, <9> 34.5592, <10> 21.4442;
param workload[JOB] := <1> 498.3029, <2> 602.7663, <3> 634.5109, <4> 617.9351, <5> 988.8509, <6> 300.6409, <7> 415.4585, <8> 828.1388, <9> 1194.3383, <10> 459.8537;
param capacity[MACHINE] := <1> 2180.2654, <2> 2180.2654, <3> 2180.2654;

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
