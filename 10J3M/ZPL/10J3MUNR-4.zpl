set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.7963, <2> 10.5983, <3> 37.0184, <4> 1.8562, <5> 22.7462, <6> 40.9014, <7> 29.6533, <8> 38.3009, <9> 20.2332, <10> 27.1625;
param workload[JOB] := <1> 23.2618, <2> 19.2151, <3> 49.9152, <4> 21.763, <5> 43.9958, <6> 11.9324, <7> 43.9494, <8> 6.2258, <9> 25.9509, <10> 47.7362;
param capacity[MACHINE] := <1> 293.9456, <2> 293.9456, <3> 293.9456;

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
