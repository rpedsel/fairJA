set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1556, <2> 16.6331, <3> 27.4264, <4> 22.3669, <5> 27.1878, <6> 25.9539, <7> 26.5864, <8> 19.9464, <9> 28.9507, <10> 21.0607;
param workload[JOB] := <1> 25.1556, <2> 16.6331, <3> 27.4264, <4> 22.3669, <5> 27.1878, <6> 25.9539, <7> 26.5864, <8> 19.9464, <9> 28.9507, <10> 21.0607;
param capacity[MACHINE] := <1> 241.2679, <2> 241.2679, <3> 241.2679;

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
