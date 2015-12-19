set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.8774, <2> 26.1276, <3> 28.7415, <4> 19.1259, <5> 29.4502, <6> 25.4096, <7> 25.9893, <8> 21.5455, <9> 24.0463, <10> 20.6075;
param workload[JOB] := <1> 24.8774, <2> 26.1276, <3> 28.7415, <4> 19.1259, <5> 29.4502, <6> 25.4096, <7> 25.9893, <8> 21.5455, <9> 24.0463, <10> 20.6075;
param capacity[MACHINE] := <1> 245.9208, <2> 245.9208, <3> 245.9208;

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
