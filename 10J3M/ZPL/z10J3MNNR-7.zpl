set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7572, <2> 30.8041, <3> 19.9521, <4> 21.726, <5> 24.8367, <6> 28.9083, <7> 28.1195, <8> 23.724, <9> 14.8465, <10> 28.3108;
param workload[JOB] := <1> 10.6291, <2> 44.8979, <3> 37.5679, <4> 11.0345, <5> 1.934, <6> 40.5163, <7> 7.1736, <8> 39.5736, <9> 48.0969, <10> 5.3414;
param capacity[MACHINE] := <1> 246.7652, <2> 246.7652, <3> 246.7652;

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
