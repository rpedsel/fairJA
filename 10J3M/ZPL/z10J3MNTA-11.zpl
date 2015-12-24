set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.9546, <2> 22.9589, <3> 25.738, <4> 24.5345, <5> 28.2883, <6> 23.3313, <7> 32.4837, <8> 25.5715, <9> 19.0764, <10> 35.0066;
param workload[JOB] := <1> 673.6413, <2> 527.1111, <3> 662.4446, <4> 601.9417, <5> 800.2279, <6> 544.3496, <7> 1055.1908, <8> 653.9016, <9> 363.909, <10> 1225.462;
param capacity[MACHINE] := <1> 1777.0449, <2> 1777.0449, <3> 1777.0449;

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
