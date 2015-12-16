set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.7368, <2> 26.7072, <3> 25.1617, <4> 24.7798, <5> 24.2613, <6> 22.918, <7> 24.8885, <8> 27.0204, <9> 23.0784, <10> 23.1018;
param workload[JOB] := <1> 5.1708, <2> 5.1679, <3> 5.0161, <4> 4.9779, <5> 4.9256, <6> 4.7873, <7> 4.9888, <8> 5.1981, <9> 4.804, <10> 4.8064;
param capacity[MACHINE] := <1> 12.4607, <2> 12.4607, <3> 12.4607;

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
