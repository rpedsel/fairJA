set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8081, <2> 32.131, <3> 22.9464, <4> 35.4658, <5> 21.3379, <6> 20.0898, <7> 31.2032, <8> 15.7261, <9> 36.4013, <10> 24.9552;
param workload[JOB] := <1> 13.5596, <2> 18.2724, <3> 32.417, <4> 12.3679, <5> 27.0746, <6> 44.1745, <7> 14.7285, <8> 17.3903, <9> 28.3927, <10> 0.4931;
param capacity[MACHINE] := <1> 52.2176, <2> 52.2176, <3> 52.2176;

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
