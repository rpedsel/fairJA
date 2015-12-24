set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.5828, <2> 28.3174, <3> 20.1668, <4> 21.2294, <5> 28.2524, <6> 28.3651, <7> 26.3523, <8> 22.3649, <9> 22.1894, <10> 25.8641;
param workload[JOB] := <1> 39.0796, <2> 38.0526, <3> 48.1417, <4> 12.0979, <5> 12.0679, <6> 11.0421, <7> 8.2186, <8> 16.1347, <9> 37.023, <10> 27.1692;
param capacity[MACHINE] := <1> 83.0091, <2> 83.0091, <3> 83.0091;

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
