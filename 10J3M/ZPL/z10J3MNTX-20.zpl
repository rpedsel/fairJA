set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1832, <2> 31.5081, <3> 35.7981, <4> 24.3115, <5> 19.6873, <6> 29.9191, <7> 27.8317, <8> 24.7211, <9> 22.8835, <10> 19.693;
param workload[JOB] := <1> 5.0183, <2> 5.6132, <3> 5.9832, <4> 4.9307, <5> 4.437, <6> 5.4698, <7> 5.2756, <8> 4.972, <9> 4.7837, <10> 4.4377;
param capacity[MACHINE] := <1> 12.7303, <2> 12.7303, <3> 12.7303;

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
