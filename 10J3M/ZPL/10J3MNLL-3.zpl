set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.5883, <2> 21.78, <3> 21.1227, <4> 25.6047, <5> 20.9268, <6> 22.645, <7> 24.1251, <8> 25.5656, <9> 24.1733, <10> 30.5051;
param workload[JOB] := <1> 21.5883, <2> 21.78, <3> 21.1227, <4> 25.6047, <5> 20.9268, <6> 22.645, <7> 24.1251, <8> 25.5656, <9> 24.1733, <10> 30.5051;
param capacity[MACHINE] := <1> 79.3455, <2> 79.3455, <3> 79.3455;

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
