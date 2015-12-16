set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2209, <2> 24.9449, <3> 37.6915, <4> 45.528, <5> 21.0769, <6> 22.0906, <7> 27.665, <8> 39.4519, <9> 29.0842, <10> 35.5884;
param workload[JOB] := <1> 27.2209, <2> 24.9449, <3> 37.6915, <4> 45.528, <5> 21.0769, <6> 22.0906, <7> 27.665, <8> 39.4519, <9> 29.0842, <10> 35.5884;
param capacity[MACHINE] := <1> 77.5855, <2> 77.5855, <3> 77.5855;

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
